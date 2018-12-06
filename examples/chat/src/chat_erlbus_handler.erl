-module(chat_erlbus_handler).

%% API
-export([handle_msg/2]).

-define(KICUT, << "Wadidaw" >>).

handle_msg(Msg, Context) ->
  {Conn, Text} = Msg,
  if 
    Text == << "login" >> -> Context ! {message_published, {Conn, <<"(Telah bergabung ke dalam obrolan)">>}};
    Text == << "logout" >> -> Context ! {message_published, {Conn, <<"(Telah meninggalkan obrolan)">>}};
    true -> Context ! {message_published, Msg}   
  end.