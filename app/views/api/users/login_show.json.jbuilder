friends_array = @friends.map { |friend| friend.id }

json.friends do 
  json.array! friends_array
end

json.channels do
  @channels.each do |channel|
    json.set! channel.id do
      json.partial! 'api/channels/channel', channel: channel
    end
  end
end

json.voice_channels do 
  @audio_channels.each do |audio_channel|
    json.set! audio_channel.id do
      json.partial! 'api/audio_channels/audio_channel', audio_channel: audio_channel
    end
  end
end

json.users do
  @users.each do |user|
    json.set! user.id do
      json.partial! 'api/users/user', user: user
    end
  end
  @friends.each do |user|
    json.set! user.id do
      json.partial! 'api/users/user', user: user
    end
  end
  @incoming_friends.each do |user|
    json.set! user.id do
      json.partial! 'api/users/user', user: user
    end
  end
  @pending_friends.each do |user|
    json.set! user.id do
      json.partial! 'api/users/user', user: user
    end
  end
  json.set! @current_user.id do
    json.partial! 'api/users/user', user: @current_user
  end
end

@servers.each do |server|
  json.set! server.id do
    json.partial! 'api/servers/server', server: server
  end
end

json.current_user_id @current_user.id