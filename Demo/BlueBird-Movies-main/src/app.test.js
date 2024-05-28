// Login.test.js
import React from 'react';
import { render, fireEvent } from '@testing-library/react';
import Login from './auth/Login';

test('kiểm tra chức năng đăng nhập', () => {
  const GoogleLogin = jest.fn();
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ GoogleLogin }));
  const { getByText } = render(<Login />);
  expect(getByText('Đăng nhập với Google')).toBeInTheDocument();
  fireEvent.click(getByText('Đăng nhập với Google'));
  expect(GoogleLogin).toHaveBeenCalledTimes(1);
});

// Detail.test.js
import Detail from './components/Detail';

test('kiểm tra chức năng chi tiết', () => {
  const setLoader = jest.fn();
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ setLoader }));
  const { getByText } = render(<Detail />);
  expect(getByText('Ngày phát hành :')).toBeInTheDocument();
  fireEvent.click(getByText('Xem ngay'));
  expect(setLoader).toHaveBeenCalledTimes(1);
});

// Genre.test.js
import Genre from './components/Genre';

test('kiểm tra chức năng thể loại', () => {
  const fetchGenre = jest.fn();
  const setActiveGenre = jest.fn();
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ fetchGenre, setActiveGenre }));
  const { getByText } = render(<Genre />);
  expect(document.title).toEqual('Phim BlueBird | Thể loại');
  fireEvent.click(getByText('Action'));
  expect(setActiveGenre).toHaveBeenCalledTimes(1);
});

// Header.test.js
import Header from './components/Header';
import { createMemoryHistory } from 'history';
import { Router } from 'react-router-dom';

test('kiểm tra chức năng Header', () => {
  const backgenre = true;
  const header = "Tiêu đề";
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ backgenre, header }));
  const history = createMemoryHistory();
  const { getByText } = render(
    <Router history={history}>
      <Header />
    </Router>
  );
  expect(getByText('Tiêu đề')).toBeInTheDocument();
  fireEvent.click(getByText('Tiêu đề'));
  expect(history.location.pathname).toBe('/');
});

// Moviecard.test.js
import Moviecard from './components/Moviecard';

test('kiểm tra chức năng Moviecard', () => {
  const user = true;
  const movie = {
    id: 1,
    title: "Test Movie",
    vote_average: 8
  };
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ user }));
  const history = createMemoryHistory();
  const { getByText } = render(
    <Router history={history}>
      <Moviecard movie={movie} />
    </Router>
  );
  expect(getByText('Test Movie')).toBeInTheDocument();
  fireEvent.click(getByText('Test Movie'));
  expect(history.location.pathname).toBe('/moviedetail/1');
});

// Movies.test.js
import Movies from './components/Movies';

test('kiểm tra chức năng Movies', () => {
  const movies = [
    { id: 1, title: "Test Movie 1" },
    { id: 2, title: "Test Movie 2" },
  ];
  const setPage = jest.fn();
  const setMovies = jest.fn();
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ movies, setPage, setMovies }));
  const history = createMemoryHistory();
  const { getByText } = render(
    <Router history={history}>
      <Movies />
    </Router>
  );
  expect(getByText('Test Movie 1')).toBeInTheDocument();
  expect(getByText('Test Movie 2')).toBeInTheDocument();
  fireEvent.click(getByText('Test Movie 1'));
  expect(history.location.pathname).toBe('/moviedetail/1');
});

// Navbar.test.js
import Navbar from './components/Navbar';
import { toast } from 'react-toastify';

test('kiểm tra chức năng Navbar', () => {
  const user = { displayName: "Test User", photoURL: null };
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ user }));
  toast.error = jest.fn();
  const { getByText } = render(<Navbar />);
  expect(getByText('Test User')).toBeInTheDocument();
  fireEvent.click(getByText('Đăng xuất'));
  expect(toast.error).toHaveBeenCalledWith("Đăng xuất thành công");
});

// Pagebtn.test.js
import Pagebtn from './components/Pagebtn';

test('kiểm tra chức năng Pagebtn', () => {
  const setPage = jest.fn();
  const page = 2;
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ setPage, page }));
  const { getByText } = render(<Pagebtn />);
  expect(getByText('2')).toBeInTheDocument();
  fireEvent.click(getByText('Back'));
  expect(setPage).toHaveBeenCalledWith(1);
  fireEvent.click(getByText('Next'));
  expect(setPage).toHaveBeenCalledWith(3);
});

// Container.test.js
import Container from './pages/Container';

test('kiểm tra chức năng Container', () => {
  const setMovies = jest.fn();
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ setMovies }));
  const history = createMemoryHistory();
  const { getByTestId } = render(
    <Router history={history}>
      <Route path="/search/:query">
        <Container />
      </Route>
    </Router>
  );
  expect(getByTestId('search-component')).toBeInTheDocument();
});

import Searchbar from './components/Searchbar';

describe('kiểm tra chức năng thanh tìm kiếm', () => {
  it('Cập nhật về thay đổi', () => {
    const setGenres = jest.fn();
    const fetchSearch = jest.fn();
    const setBackGenre = jest.fn();
    const filteredGenre = [];

    const { getByPlaceholderText } = render(
      <Contextpage.Provider value={{ filteredGenre, fetchSearch, setBackGenre, setGenres }}>
        <Router>
          <Searchbar />
        </Router>
      </Contextpage.Provider>
    );

    const searchInput = getByPlaceholderText('Tìm kiếm phim');
    fireEvent.change(searchInput, { target: { value: 'test' } });
    expect(searchInput.value).toBe('test');
  });
});


// Favoritepage.test.js
import Favoritepage from './pages/Favoritepage';

test('kiểm tra chức năng Favoritepage', () => {
  const loader = false;
  const GetFavorite = jest.fn();
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ loader, GetFavorite }));
  const { getByText } = render(<Favoritepage />);
  expect(document.title).toEqual('BlueBird Movies | Phim yêu thích');
  fireEvent.click(getByText('Chưa có dấu trang!'));
  expect(GetFavorite).toHaveBeenCalledTimes(1);
});

// Player.test.js
import Player from './pages/Player';


test('kiểm tra chức năng Player', () => {
  const setHeader = jest.fn();
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ setHeader }));
  const history = createMemoryHistory();
  const { getByTestId } = render(
    <Router history={history}>
      <Route path="/player/:id">
        <Player />
      </Route>
    </Router>
  );
  expect(document.title).toContain('BlueBird Movies | ');
  fireEvent.click(getByTestId('back-button'));
  expect(history.length).toBe(1);
});

// Search.test.js
import Search from './pages/Search';

test('kiểm tra chức năng Search', () => {
  const fetchSearch = jest.fn();
  const searchedMovies = [
    { id: 1, title: "Test Movie 1" },
    { id: 2, title: "Test Movie 2" },
  ];
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ fetchSearch, searchedMovies }));
  const { getByText } = render(
    <MemoryRouter initialEntries={["/search/test"]}>
      <Route path="/search/:query">
        <Search />
      </Route>
    </MemoryRouter>
  );
  expect(getByText('Test Movie 1')).toBeInTheDocument();
  expect(getByText('Test Movie 2')).toBeInTheDocument();
});

// Trending.test.js
import Trending from './pages/Trending';

test('kiểm tra chức năng Trending', () => {
  const loader = false;
  const fetchTrending = jest.fn();
  const trending = [
    { id: 1, title: "Test Movie 1" },
    { id: 2, title: "Test Movie 2" },
  ];
  const page = 1;
  const totalPage = 2;
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ loader, fetchTrending, trending, page, totalPage }));
  const { getByText } = render(<Trending />);
  expect(document.title).toEqual('BlueBird Movies | Đang hot');
  expect(getByText('Test Movie 1')).toBeInTheDocument();
  expect(getByText('Test Movie 2')).toBeInTheDocument();
});

// Upcoming.test.js
import Upcoming from './pages/Upcoming';

test('kiểm tra chức năng Upcoming', () => {
  const loader = false;
  const fetchUpcoming = jest.fn();
  const upcoming = [
    { id: 1, title: "Test Movie 1" },
    { id: 2, title: "Test Movie 2" },
  ];
  const page = 1;
  const totalPage = 2;
  jest.spyOn(React, 'useContext').mockImplementation(() => ({ loader, fetchUpcoming, upcoming, page, totalPage }));
  const { getByText } = render(<Upcoming />);
  expect(document.title).toEqual('BlueBird Movies | Phim sắp ra mắt');
  expect(getByText('Test Movie 1')).toBeInTheDocument();
  expect(getByText('Test Movie 2')).toBeInTheDocument();
});

// App.test.js
import App from './App';

test('kiểm tra chức năng App', () => {
  const { getByText } = render(
    <MemoryRouter initialEntries={["/"]}>
      <App />
    </MemoryRouter>
  );
  expect(document.title).toContain('BlueBird Movies');
});

// index.test.js


