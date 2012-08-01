# -*- coding: utf-8 -*-

class Tatami
  def tl2points
    ar = []
    txt = []
    ret = {}

    Twitter.public_timeline.each do |d|
      txt << d.text
      d.text.split(//).each do |s|
        ar << format("%x", s.unpack("U*")[0]).scan(/../)
      end
      ar.flatten!
    end
    ret['points'] = ar.join.scan(/..../).map{ |x| x.scan(/../).map{ |y| (y.hex) * 2}.join(',')}.join(' ')
    ret['texts'] = txt.join
    
    ret
  end
end

get '/styles.css' do
  sass :styles
end

get '/' do
  tl_src = Tatami.new.tl2points
  @pts = tl_src['points']
  @txt = tl_src['texts']
  haml :index
end
