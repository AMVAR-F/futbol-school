import React, { Suspense, useEffect, useState } from 'react';
import { HashRouter,Route, Routes, Navigate} from 'react-router-dom';
import { useSelector } from 'react-redux';


import { CSpinner, useColorModes } from '@coreui/react';
import './scss/style.scss';

// Containers
const DefaultLayout = React.lazy(() => import('./layout/DefaultLayout'));

// Pages
const Register = React.lazy(() => import('./views/pages/register/Register'));
const Page404 = React.lazy(() => import('./views/pages/page404/Page404'));
const Page500 = React.lazy(() => import('./views/pages/page500/Page500'));
const ForgotPassword = React.lazy(() => import('./views/login/forgot-password'))
const Code = React.lazy(() => import('./views/login/code'))
const NewPassword = React.lazy(() => import('./views/login/newpassword'))
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

    if (isColorModeSet()) {
      return;
    }

    setColorMode(storedTheme);
  }, []);

  const handleLogin = () => {
    setIsAuthenticated(true); // Simula autenticación exitosa
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
    <Route path="/login" element={<LoginForm onLogin={handleLogin} />} />
  ) : (
    <>
      <Route path="*" element={<DefaultLayout />} />
      <Route path="/account/profile" name="Profile Page" element={<Profile />} />
    </>
  )}
  <Route path="/register" name="Register Page" element={<Register />} />
  <Route path="/404" name="Page 404" element={<Page404 />} />
  <Route path="/500" name="Page 500" element={<Page500 />} />
  <Route path="*" element={<Navigate to="/login" />} />
  <Route exact path="/forgot-password" name="Forgot Password" element={<ForgotPassword />} />
  <Route exact path="/code" name="Code" element={<Code />} />
  <Route exact path="/newpassword" name="New Password" element={<NewPassword />} />
</Routes>

      </Suspense>
    </HashRouter>
  );
};

export default App;
