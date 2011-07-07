# -*- coding: utf-8 -*-

class Tw
  def tl
    ar = []
    Twitter.public_timeline.each do |d|
      d.text.split(//).each do |s|
        ar << format("%x", s.unpack("U*")[0]).scan(/../)
      end
      ar.flatten!
    end
    ar.map! {|h| (h.hex) * 2}.join(',')
  end
end

get '/' do
  @ar = Tw.new.tl
  haml :index
end
