$("document").ready(function(){

    $('#example').DataTable({
        ajax: 'https://luismgz.github.io/myjson.json',
        columns: [
            { data: 'name' },
            { data: 'language' },
            { data: 'id' },
            { data: 'bio' },
            { data: 'version' }
        ]
    });

});
