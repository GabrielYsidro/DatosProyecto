
export const fetchRecurso = async (tabla) => {
    try {
        const response = await fetch(`http://localhost:5000/api/${tabla}`)
        if (!response.ok) {
            throw new Error('Error al obtener recursos')
        } else {
            const data = await response.json()
            return data
        }
    } catch (error) {
        console.error('Error: ', error)
    }
}

export default fetchRecurso;