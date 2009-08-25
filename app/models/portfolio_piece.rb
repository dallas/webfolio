class PortfolioPiece < Struct.new(:category, :slug, :title, :url)
  
  PIECES = [
    ['web', 'le-grand-cru',       'Le Grand Cru',             'http://legrandcru.us/'],
    ['web', 'le-grand-cru-blog',  'Le Blog of Le Grand Cru',  'http://blog.legrandcru.us/'],
    ['web', 'winecliq',           'WinecliQ',                 'http://winecliq.com/'],
    ['web', 'american-winery',    'American Winery',          'http://www.americanwinery.com/'],
    ['web', 'd-and-n-blog',       'd&n.blog',                 'http://dallasandnicole.com/'],
    ['web', 'i-do-wedding-app',   'iDo wedding app',          'http://github.com/coffeepostal/iDo-Wedding-App/tree/master'],
    ['web', 'd-and-n-wedding',    'd&n.wedding',              'http://wedding.dallasandnicole.com'],
    
    # ['print', 'something',        'Something'],
  ]
  
  class << self
    def all
      PIECES.map do |piece|
        self.new(*piece)
      end
    end
    
    def web
      all.select {|p| p.category == 'web'}
    end
    
    def print
      all.select {|p| p.category == 'print'}
    end
  end
  
  def image_path(size = :thumb)
    "portfolio/#{category}/#{size}/#{slug}.jpg"
  end
end
