export async function uploadFile(file) {
    const formData = new FormData();
    formData.append('file', file);
  
    try {
      const response = await fetch('http://localhost:5000/upload', {
        method: 'POST',
        body: formData,
      });
  
      if (!response.ok) {
        throw new Error('Error al subir el archivo');
      }
      const data = await response.json();
      return data; // Retorna la respuesta del servidor (por ejemplo, URL del archivo)
    } catch (error) {
      console.error('Error en la carga de archivo:', error);
      throw error;
    }
  }

export default uploadFile;