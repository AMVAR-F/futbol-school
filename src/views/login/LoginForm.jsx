import React from 'react'
import '../../css/login.css'
import { FaRegUser, FaUserLock } from 'react-icons/fa'
import { Link } from 'react-router-dom'

const LoginForm = ({ onLogin }) => {
  const handleSubmit = (e) => {
    e.preventDefault()
    onLogin()
  }

  return (
    <div className='login-body'>
      <div className="login-wrapper">
        <form onSubmit={handleSubmit}>
          
          <div className="img-container">
            <img src="src/assets/images/logo.jpeg" alt="logo" className="logo-img" />
          </div>
          <div className="input-box">
            <input type="text" name="username" placeholder="Username" required />
            <FaRegUser className="icon" />
          </div>
          <div className="input-box">
            <input type="password" name="password" placeholder="Password" required />
            <FaUserLock className="icon" />
          </div>
          <div className="remember-forgot">
            <label>
              <input type="checkbox" /> Remember me
            </label>
            <Link to="/forgot-password">Forgot password?</Link>
          </div>
          <br />
          <Link to="./index.js"> <button type="submit">Login</button></Link>
         
          <div className="register-link">
            <p>
              Don't have an account? <a href="#">Register</a>
            </p>
          </div>
        </form>
      </div>
    </div>
  )
}

export default LoginForm
