$("document").ready(function(){

    $('#example').DataTable({
        ajax: 'https://luismgz.github.io/json.json',
        columns: [
            { data: 'name' },
            { data: 'position' },
            { data: 'office' },
            { data: 'extn' },
            { data: 'start_date' },
            { data: 'salary' }
        ],
        language: {
            info: 'Mostrando pagina _PAGE_ de _PAGES_',
            search:'Buscar',
            lengthMenu: 'Desplegar _MENU_ por pagina',
            infoFiltered: ' - filtrado de _MAX_ resultados',
            infoEmpty: 'Nada que mostrar',
            loadingRecords: "Cargando..."
        }
    });
    

});
