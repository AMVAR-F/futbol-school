import React, { useState } from 'react';
import '../../css/login.css';
import { FaRegUser, FaUserLock } from 'react-icons/fa';
import { Link } from 'react-router-dom';
import { CAvatar } from '@coreui/react';
import Logo from './../../assets/images/logo.jpeg';
import { useLogin } from './useLogin'; 

const LoginForm = ({ onLogin }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const { login, error } = useLogin();

  const handleSubmit = async (e) => {
    e.preventDefault();
    const success = await login(username, password);
    if (success) {
      onLogin(); // Llama a onLogin para cambiar el estado en App.js
    }
  };

  return (
    <div className='login-body'>
      <div className="login-wrapper">
        <form onSubmit={handleSubmit}>
          <div className="img-container">
            <CAvatar src={Logo} className='logo-img' />
          </div>
          <div className="input-box">
            <input 
              type="text" 
              name="username" 
              placeholder="Username" 
              value={username} 
              onChange={(e) => setUsername(e.target.value)} 
              required 
            />
            <FaRegUser className="icon" />
          </div>
          <div className="input-box">
            <input 
              type="password" 
              name="password" 
              placeholder="Password" 
              value={password} 
              onChange={(e) => setPassword(e.target.value)} 
              required 
            />
            <FaUserLock className="icon" />
          </div>
          {error && <p className="error-message">{error}</p>} {/* Mostrar error si existe */}
          <div className="remember-forgot">
            <label>
              <input type="checkbox" /> Remember me
            </label>
            <Link to="/forgot-password">Forgot password?</Link>
          </div>
          <br />
          <button type="submit">Login</button>
          <div className="register-link">
            <p>
              Don't have an account? <a href="#">Register</a>
            </p>
          </div>
        </form>
      </div>
    </div>
  );
};

export default LoginForm;