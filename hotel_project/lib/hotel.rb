require_relative "room"

class Hotel
  def initialize (hotel_name, room)
    @name = hotel_name
    @rooms = {}
    
    room.each { |key, val| @rooms[key] = Room.new(val) }
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(name, room_name)
    
    if !self.room_exists?(room_name)
      puts "sorry, #{room_name} does not exist" 
    else 
      if @rooms[room_name].add_occupant(name) 
        puts "check in successful" 
      else
        puts "sorry, room is full"
      end
    end
    
  end

  def has_vacancy?
    @rooms.values.any? { |occupancy| !(occupancy.full?) }
  end
  
  def list_rooms
    @rooms.each { |room, occupancy| puts "#{room} : #{occupancy.available_space}" }
  end

end
