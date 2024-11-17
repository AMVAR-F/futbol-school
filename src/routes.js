import React from 'react';

const Dashboard = React.lazy(() => import('./views/dashboard/Dashboard'));
const Users = React.lazy(() => import('./views/users/board'));
const Profile = React.lazy(() => import('./views/account/profile'));
const Registration = React.lazy(() => import('./views/users/Team/registration'));
const Tournament = React.lazy(() => import('./views/matches/tournament/definition'));


const routes = [
  { path: '/', name: 'Home', element: Dashboard },
  { path: '/dashboard', name: 'Dashboard', element: Dashboard },
  { path: '/users', name: 'Users', element: Users },
  { path: '/account/profile', name: 'Profile', element: Profile },
  { path: '/users/Team/', name: 'Registration', element: Registration },
  { path: '/matches/tournament', name: 'Tournament', element: Tournament },
];

export default routes;
