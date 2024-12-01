<script>
    import MostrarIncidenciaDev from "../../../componentes/MostrarIncidenciaDev.svelte";
    import { page } from "$app/stores";
  
    let params;
  
    $: params = $page.params;
  
    console.log("Params en +page.svelte:", params);
  </script>
  
  <MostrarIncidenciaDev {params} />