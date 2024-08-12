$("document").ready(function(){

    $('#example').DataTable({
        ajax: 'https://luismgz.github.io/myjson2.json',
        columns: [
            { data: 'name' },
            { data: 'language' },
            { data: 'id' },
            { data: 'bio' },
            { data: 'version' }
        ]
    });

});
