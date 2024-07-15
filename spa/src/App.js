import React, { useState } from 'react';
import './App.css';

function App() {
  const [message] = useState('Welcome to the React App Test with cdn');
  const [backendMessage, setBackendMessage] = useState('');

  const fetchBackendMessage = async () => {
    try {
      const response = await fetch('https://dv5o0xxr7paq7.cloudfront.net/api/hello');
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const data = await response.json();
      setBackendMessage(data.message);
    } catch (error) {
      console.error('Error fetching the backend message:', error);
      setBackendMessage('Failed to fetch message from backend');
    }
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>{message}</h1>
        <button onClick={fetchBackendMessage}>Get Backend Message</button>
        {backendMessage && <p>{backendMessage}</p>}
      </header>
    </div>
  );
}

export default App;
