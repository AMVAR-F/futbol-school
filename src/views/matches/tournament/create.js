import React, { useState } from 'react';

function TournamentForm() {
    const [formData, setFormData] = useState({
        name: '',
        startDate: '',
        endDate: '',
        category: ''
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({
            ...formData,
            [name]: value
        });
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        // Validación de campos vacíos
        const { name, startDate, endDate, category } = formData;
        if (!name || !startDate || !endDate || !category) {
            alert('Por favor, complete todos los campos.');
            return;
        }

        // Validación de fechas
        if (new Date(startDate) >= new Date(endDate)) {
            alert('La fecha de fin debe ser posterior a la fecha de inicio.');
            return;
        }

        alert(`¡Torneo "${name}" creado exitosamente!\nCategoría: ${category}\nFecha: ${startDate} a ${endDate}`);
        // Aquí podrías resetear el formulario o enviar los datos a una API
    };

    return (
        <div style={{ maxWidth: '400px', margin: 'auto', padding: '20px' }}>
            <h2>Formulario de Creación de Torneo</h2>
            <form onSubmit={handleSubmit}>
                <label htmlFor="name">Nombre del Torneo:</label>
                <input
                    type="text"
                    id="name"
                    name="name"
                    value={formData.name}
                    onChange={handleChange}
                    required
                    style={inputStyle}
                />

                <label htmlFor="startDate">Fecha de Inicio:</label>
                <input
                    type="date"
                    id="startDate"
                    name="startDate"
                    value={formData.startDate}
                    onChange={handleChange}
                    required
                    style={inputStyle}
                />

                <label htmlFor="endDate">Fecha de Fin:</label>
                <input
                    type="date"
                    id="endDate"
                    name="endDate"
                    value={formData.endDate}
                    onChange={handleChange}
                    required
                    style={inputStyle}
                />

                <label htmlFor="category">Categoría:</label>
                <select
                    id="category"
                    name="category"
                    value={formData.category}
                    onChange={handleChange}
                    required
                    style={inputStyle}
                >
                    <option value="">Seleccione una categoría</option>
                    <option value="juvenil">Juvenil</option>
                    <option value="adulto">Adulto</option>
                    <option value="profesional">Profesional</option>
                </select>

                <button type="submit" style={buttonStyle}>Crear Torneo</button>
            </form>
        </div>
    );
}

// Estilos básicos para el formulario y el botón
const inputStyle = {
    width: '100%',
    padding: '8px',
    marginBottom: '15px',
    borderRadius: '4px',
    border: '1px solid #ccc'
};

const buttonStyle = {
    width: '100%',
    padding: '10px',
    backgroundColor: '#4CAF50',
    color: 'white',
    border: 'none',
    borderRadius: '4px',
    cursor: 'pointer'
};

export default TournamentForm;
