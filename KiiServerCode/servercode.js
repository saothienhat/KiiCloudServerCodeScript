
function your_trigger_function_name(params, context, done) {

  var admin = context.getAppAdminContext();

  (function(token) {
    // Acquire user information based on Token
    var d = new $.Deferred;
    KiiUser.authenticateWithToken(token, {
      success: function(user) { d.resolve(user); },
      failure: function(err) { d.reject(err); }
    });
    return d.promise();
  })(context.getAccessToken())
  .then(function(user) {
    // Get Object of trigger 
    var d = new $.Deferred;
    var objectId = params.objectID;
    var q = KiiQuery.queryWithClause(KiiClause.equals("_id", objectId));
    var bucket = Kii.bucketWithName(params.bucketID);
    bucket.executeQuery(q, {
      success: function(queryWithClause, resultSet) { d.resolve(user, resultSet); },
      failure: function(err) { d.reject(err); }
    });
    return d.promise();
  });
}




var _ = require('underscore');
