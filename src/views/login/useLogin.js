import { useState } from 'react';

export const useLogin = () => {
    const [error, setError] = useState(null);

    const login = async (username, password) => {
        try {
            const response = await fetch('http://localhost:3001/users');

            // Check if response is ok
            if (!response.ok) {
                const errorText = await response.text(); // Get error response text
                throw new Error(`HTTP error! status: ${response.status}, message: ${errorText}`);
            }

            // Attempt to parse JSON
            let users;
            try {
                users = await response.json();
            } catch (jsonError) {
                throw new Error('Error parsing JSON response: ' + jsonError.message);
            }

            // Find user with matching credentials
            const user = users.find(user => user.username === username && user.password === password);
            
            if (user) {
                // Simulate token generation
                const token = `${user.id}-${Date.now()}`; 
                localStorage.setItem('authToken', token); // Store token in localStorage
                return true; // Login successful
            } else {
                setError('Credenciales incorrectas');
                return false; // Login failed
            }
        } catch (error) {
            setError(error.message || 'Error al conectarse al servidor');
            console.error('Login error:', error);
        }
    };

    return { login, error };
};