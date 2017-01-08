// Models are where actual data is kept. They can also be used
// for communicating between the server and the client through
// methods like save() and fetch().
//
// Models are the abstract data and do not know how they are
// supposed to be visualized. But they can perform validations
// to ensure the data is correct.
var models = {};

// Our base model is "person"
models.Person = Backbone.Model.extend({

  // Example of how to do a validation in a model
  validate: function(attributes) {
    if (typeof attributes.firstname !== 'string') {
      // Return a failed validation
      return 'Firstname is mandatory';
    }
    if (typeof attributes.lastname !== 'string') {
      // Return a failed validation
      return 'Lastname is mandatory';
    }
    // All validations passed, don't return anything
  }

});

// People collection
models.People = Backbone.Collection.extend({
  model: models.Person
});
