function(doc) {
if (doc.sector=="Technology")
    {
        emit(doc.name,doc.count * doc.price);
    }  
}
