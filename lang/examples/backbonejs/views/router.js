// Router is responsible for driving the application. Usually
// this means populating the necessary data into models and
// collections, and then passing those to be displayed by
// appropriate views.
var Router = Backbone.Router.extend({
  routes: {
    '': 'index'  // At first we display the index route
  },

  index: function() {
    // Initialize a list of people
    // In this case we provide an array, but normally you'd
    // instantiate an empty list and call people.fetch()
    // to get the data from your backend
    var people = new models.People([
{
firstname: 'Arthur',
lastname: 'Dent'
},
{
firstname: 'Ford',
lastname: 'Prefect'
},
{
firstname: 'John',
lastname: 'White'
},
{
firstname: '太郎',
lastname: '山本'
},
{
firstname: '一郎',
lastname: '鈴木'
}
      ]);

    // Pass the collection of people to the view
    var view = new views.People({
      collection: people
    });

    // And render it
    view.render();

    // Example of adding a new person afterwards
    // This will fire the 'add' event in the collection
    // which causes the view to re-render
    people.add([
        {
          firstname: 'Zaphod',
          lastname: 'Beeblebrox'
        }
        ]);
  }
});

jQuery(document).ready(function() {
  // When the document is ready we instantiate the router
  var router = new Router();

  // And tell Backbone to start routing
  Backbone.history.start();
});
