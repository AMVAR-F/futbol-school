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
const Tournament = React.lazy(() => import('./views/matches/tournament/definition'));
const Groups = React.lazy(() => import('./views/matches/groups/principal'));
const Clashes = React.lazy(() => import('./views/matches/clashes/App'));
const Results = React.lazy(() => import('./views/matches/results/result'));
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
    setIsAuthenticated(true); 
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
              <Route path="/matches/tournament" element={<Tournament />} />
              <Route path="/matches/groups" element={<Groups />} />
              <Route path="/matches/clashes" element={<Clashes />} />
              <Route path="/matches/results" element={<Results />} />

              <Route path="*" element={<Navigate to="/profile" />} /> 
            </Route>
          )}
        </Routes>
      </Suspense>
    </HashRouter>
  );
};

export default App;
