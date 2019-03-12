require("phoenix_html");
var css =  require("../css/app.css");
var axios = require('axios');


window.axios = axios;
window.getStreams = function(){
  // getting the list of first 10 streamers for demo purposes 
  axios({
    method: "get",
    url: "https://api.twitch.tv/helix/streams?first=10",
    headers: {
      'Client-ID' : '9j97eww9y3ewbqtw2dnoax3j5ejdbl'
    }
  }).then(res => {
    var data = res.data.data;
    axios({
      method: "get",
      url: "https://api.twitch.tv/helix/users?id=22595528",
      headers: {
        'Client-ID' : '9j97eww9y3ewbqtw2dnoax3j5ejdbl'
      }
    }).then(res => {
      let user = res.data.data[0];
      let user_with_events = {
        thumbnail_url: user.profile_image_url,
        user_id: user.id,
        user_name: user.login,
        id: user.id
      }
      // pushing the user having events and then reversing it so it is displayed at the top
      data.push(user_with_events)
      data.reverse()
      axios({
          method: 'post',
          url: "/api/parse-streams",
          data: {streamers: data}
        }
      ).then(res => {
        document.write(res.data);
      });
    });
  });
};
