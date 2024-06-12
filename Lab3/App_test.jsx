// App.test.js

import React from 'react';
import { render, fireEvent, waitFor, screen } from '@testing-library/react';
import App from './App';

describe('App component', () => {
  it('allows users to login', async () => {
    render(<App />);

    fireEvent.change(screen.getByLabelText('Username'), { target: { value: 'username' } });
    fireEvent.change(screen.getByLabelText('Password'), { target: { value: 'password' } });
    fireEvent.click(screen.getByText('Login'));

    await waitFor(() => expect(screen.getByText('Welcome, username')).toBeInTheDocument());
  });

  it('allows users to register', async () => {
    render(<App />);

    fireEvent.click(screen.getByText('Register'));

    fireEvent.change(screen.getByLabelText('Username'), { target: { value: 'newuser' } });
    fireEvent.change(screen.getByLabelText('Password'), { target: { value: 'newpassword' } });
    fireEvent.click(screen.getByText('Register'));

    await waitFor(() => expect(screen.getByText('Welcome, newuser')).toBeInTheDocument());
  });

  it('allows users to request password reset', async () => {
    render(<App />);

    fireEvent.click(screen.getByText('Forgot Password'));

    fireEvent.change(screen.getByLabelText('Email'), { target: { value: 'test@example.com' } });
    fireEvent.click(screen.getByText('Reset Password'));

    await waitFor(() => expect(screen.getByText('Password reset email sent')).toBeInTheDocument());
  });

  it('allows users to add, edit, and delete products', async () => {
    render(<App />);

    // Add product
    fireEvent.change(screen.getByLabelText('Product Name'), { target: { value: 'New Product' } });
    fireEvent.change(screen.getByLabelText('Price'), { target: { value: '100' } });
    fireEvent.click(screen.getByText('Add Product'));
    await waitFor(() => expect(screen.getByText('New Product')).toBeInTheDocument());

    // Edit product
    fireEvent.click(screen.getByText('Edit'));
    fireEvent.change(screen.getByLabelText('Product Name'), { target: { value: 'Edited Product' } });
    fireEvent.change(screen.getByLabelText('Price'), { target: { value: '150' } });
    fireEvent.click(screen.getByText('Save'));
    await waitFor(() => expect(screen.getByText('Edited Product')).toBeInTheDocument());

    // Delete product
    fireEvent.click(screen.getByText('Delete'));
    await waitFor(() => expect(screen.queryByText('Edited Product')).not.toBeInTheDocument());
  });

  it('allows users to view statistics', async () => {
    render(<App />);

    fireEvent.click(screen.getByText('Statistics'));

    // Add assertions for statistics page
  });
});
