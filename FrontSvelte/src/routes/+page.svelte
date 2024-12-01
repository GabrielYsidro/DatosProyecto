<script>
  import { writable } from 'svelte/store';
  import { goto } from '$app/navigation';
  import { fetchRecurso } from '../servicios/buscarRecurso.js'; // Importa tu utilidad personalizada

  // Estados del formulario
  const formData = writable({
      name: '',
      email: '',
      password: ''
  });
  const formErrors = writable({});
  const isSubmitting = writable(false);

  // Función para manejar el envío del formulario
  const handleSubmit = async () => {
      isSubmitting.set(true);
      formErrors.set({});

      // Validar que los campos no estén vacíos
      const { name, email, password } = $formData;
      const errors = {};

      if (!name) errors.name = 'El nombre es obligatorio';
      if (!email) errors.email = 'El correo es obligatorio';
      if (!password) errors.password = 'La contraseña es obligatoria';

      if (Object.keys(errors).length > 0) {
          formErrors.set(errors);
          isSubmitting.set(false);
          return;
      }

      // Validar datos en el servidor
      try {
          const usuarios = await fetchRecurso('usuarios'); // Usamos fetchRecurso para cargar usuarios

          // Buscar si el usuario existe y validar credenciales
          const user = usuarios.find(
              u =>
                  u.nombre === name &&
                  u.correo === email &&
                  u.contrasenha === password // Supongo que la contraseña no está cifrada; si lo está, esto cambiaría
          );

          if (!user) {
              formErrors.set({ general: 'Credenciales incorrectas' });
          } else {
              // Determinar rol desde las tablas hijas
              let role = null;

              if ((await fetchRecurso('usuario_cliente')).some(c => c.user_id === user.id)) {
                  role = 'cliente';
              } else if ((await fetchRecurso('usuario_analista')).some(a => a.user_id === user.id)) {
                  role = 'analista';
              } else if ((await fetchRecurso('usuario_developer')).some(d => d.user_id === user.id)) {
                  role = 'developer';
              }

              if (role) {
                  // Redirigir según el rol
                  if (role === 'cliente') goto('/cliente');
                  else if (role === 'developer') goto('/dev');
                  else if (role === 'analista') goto('/admin');
              } else {
                  formErrors.set({ general: 'Rol no asignado al usuario' });
              }
          }
      } catch (error) {
          console.error('Error al validar el usuario:', error);
          formErrors.set({ general: 'Error al conectar con el servidor' });
      }

      isSubmitting.set(false);
  };
</script>

<style>
  .error {
      color: red;
      font-size: 0.9em;
  }
  form, h1 {
      margin: auto;
      width: 60%;
      text-align: center;
  }
  h1 {
      padding-top: 1em;
      font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
      padding-bottom: 1em;
      color: rgb(96, 100, 82);
      -webkit-text-stroke: 1.5px black;
  }
  div {
      margin-bottom: 2em;
      font-size: 1.2em;
  }
  .principal {
      background-color: rgb(255, 250, 180);
      border-radius: 2em;
      height: 100%;
      padding: 12em;
  }
  input {
      width: 80%;
      font-size: 1em;
      border-radius: 0.4em;
      padding: 0.5em;
      border: 1px solid #ccc;
  }
  .envio {
      background-color: rgb(96, 100, 82);
      color: white;
      padding: 0.5em 1em;
      border-radius: 0.4em;
      font-size: 1.2em;
      cursor: pointer;
  }
  .envio:disabled {
      background-color: #ccc;
      cursor: not-allowed;
  }
</style>

<!-- Formulario de Login -->
<div class="principal">
  <h1>Iniciar Sesión</h1>
  <form on:submit|preventDefault={handleSubmit}>
      <div>
          <label for="name">Nombre:</label><br>
          <input id="name" type="text" bind:value={$formData.name} />
          {#if $formErrors.name}
              <span class="error">{$formErrors.name}</span>
          {/if}
      </div>
      <div>
          <label for="email">Correo Electrónico:</label><br>
          <input id="email" type="email" bind:value={$formData.email} />
          {#if $formErrors.email}
              <span class="error">{$formErrors.email}</span>
          {/if}
      </div>
      <div>
          <label for="password">Contraseña:</label><br>
          <input id="password" type="password" bind:value={$formData.password} />
          {#if $formErrors.password}
              <span class="error">{$formErrors.password}</span>
          {/if}
      </div>
      {#if $formErrors.general}
          <div class="error">{$formErrors.general}</div>
      {/if}
      <button class="envio" type="submit" disabled={$isSubmitting}>Iniciar Sesión</button>
  </form>
</div>
