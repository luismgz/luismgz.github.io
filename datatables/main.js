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
        ]
    });

});

