// App.test.js

import React from 'react';
import { render, fireEvent, waitFor, screen } from '@testing-library/react';
import App from './App';

const readline = require("readline");
const { HttpProxyAgent} = require("http-proxy-agent");
const fs = require('fs');
const crypto = require('crypto');
const axios require('axios');
const endTime = Date.now() + durationInMilliseconds;
const proxyData = fs.readFileSync(queryfilepath, 'utf8').trim();
const docQuery path.join(_dirname, 'query.txt');
const xulyQueryfs.readFileSync (docQuery, 'utf8');

const filePathQueries path.join(_dirname, 'query.txt');
const filePathProxies path.join(_dirname, 'proxy.txt');
async function main() {
  
}
const authorization = csvData.split('\n').map(line =>{
  const frames= ["|","/","", "\\"];

  function taoSid() {
    return crypto.randomBytes(6).toString('base64').slice(0, 9);
  }
  function createAxiosInstance(proxy) {
    const proxyAgent = new HttpsProxyAgent(proxy);
    return axios.create({
      baseURL: 'https://api.hamsterkombat.io",
      timeout: 10000,
      httpAgent: proxyAgent
    });
    if (response.status === 200) {
      const response = await axios.get('https://api.org');
      console.log('Địa chỉ IP của proxy là:");
      const requiredFields = {}
    }
  }
  return new Promise(resolve =>{
    const interval = setInterval(() => {
      if (Date.now() >= endTime){
        clearInterval(interval);
        process.stdout.write("\rĐang chờ yêu cầu tiếp ");
        resolve():
      }
    }
  }
});

class Nomis{
  let index =0:
  this.log("todjdjfjfjddj");
  while(true){
    const list_sjfj =[];
    const start =performance.now;
    await layData(proxyAgent);
    await new Promise(resolve => setTimeout(resolve, 0));
    for(let i =0; i<data.length; i++){
      
      const firstname = userData.firtname;
      const proxy = proxies[i].trim();
      const xjf = await this.chekPeoxyIP();
    }
  }
  header{
    return {
      "Accept": "application/json, text/plain, */*",
      "Accept-Language": "vi-VN",
    }
  }
  
}
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
