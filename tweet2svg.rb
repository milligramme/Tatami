# -*- coding: utf-8 -*-

class Tw
  def tl2points
    ar = []
    Twitter.public_timeline.each do |d|
      d.text.split(//).each do |s|
        ar << format("%x", s.unpack("U*")[0]).scan(/../)
      end
      ar.flatten!
    end
    ar.join.scan(/..../).map{ |x| x.scan(/../).map{ |y| (y.hex) * 2}.join(',')}.join(' ')
  end
end

get '/' do
  @ar = Tw.new.tl2points
  haml :index
end
