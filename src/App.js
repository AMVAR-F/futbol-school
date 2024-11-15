import React, { Suspense, useEffect, useState } from 'react';
import { HashRouter, Route, Routes, Navigate } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { CSpinner, useColorModes } from '@coreui/react';
import './scss/style.scss';

// Containers
const DefaultLayout = React.lazy(() => import('./layout/DefaultLayout'));

// Pages
const Register = React.lazy(() => import('./views/pages/register/Register'));
const ForgotPassword = React.lazy(() => import('./views/login/forgot-password'));
const Code = React.lazy(() => import('./views/login/code'));
const NewPassword = React.lazy(() => import('./views/login/newpassword'));
const Registration = React.lazy(() => import('./views/users/Team/registration'));
const Profile = React.lazy(() => import('./views/account/profile'));

import LoginForm from './views/login/LoginForm';

const App = () => {
  const { isColorModeSet, setColorMode } = useColorModes('coreui-free-react-admin-template-theme');
  const storedTheme = useSelector((state) => state.theme);
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  useEffect(() => {
    const urlParams = new URLSearchParams(window.location.href.split('?')[1]);
    const theme = urlParams.get('theme') && urlParams.get('theme').match(/^[A-Za-z0-9\s]+/)[0];
    if (theme) {
      setColorMode(theme);
    }

    if (!isColorModeSet()) {
      setColorMode(storedTheme);
    }
  }, [isColorModeSet, setColorMode, storedTheme]);

  const handleLogin = () => {
    setIsAuthenticated(true); // Simulate successful authentication
  };

  return (
    <HashRouter>
      <Suspense
        fallback={
          <div className="pt-3 text-center">
            <CSpinner color="primary" variant="grow" />
          </div>
        }
      >
        <Routes>
          {!isAuthenticated ? (
            <>
              <Route path="/login" element={<LoginForm onLogin={handleLogin} />} />
              <Route path="/register" element={<Register />} />
              <Route path="/forgot-password" element={<ForgotPassword />} />
              <Route path="/code" element={<Code />} />
              <Route path="/newpassword" element={<NewPassword />} />
              <Route path="*" element={<Navigate to="/login" />} />
            </>
          ) : (
            <Route element={<DefaultLayout />}>
              <Route path="/users/Team" element={<Registration />} />
              <Route path="/profile" element={<Profile />} />
              <Route path="*" element={<Navigate to="/profile" />} /> {/* Default route after login */}
            </Route>
          )}
        </Routes>
      </Suspense>
    </HashRouter>
  );
};

export default App;
