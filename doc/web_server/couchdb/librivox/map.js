function(doc) {
if (doc.language && doc.title)
    {
        emit(doc.language,doc.title);
    }  
}
