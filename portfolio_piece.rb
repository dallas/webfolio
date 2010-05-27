class PortfolioPiece < Struct.new(:category, :slug, :title, :href)
  PIECES = [
    ['web', 'american-winery',    'AmericanWinery.com',       'http://www.americanwinery.com/'],
    ['web', 'wineraq',            'WineRAQ',                  'http://wineraq.com/'],
    ['web', 'premier-cellar',     'PremierCellar',            'http://premiercellar.com/'],
    ['web', 'wine-store',         'Online WineStores',        'http://www.americanwinery.com/triovintners'],
    ['web', 'le-grand-cru',       'Le Grand Cru',             'http://legrandcru.us/'],
    ['web', 'le-grand-cru-blog',  'Le Blog of Le Grand Cru',  'http://blog.legrandcru.us/'],
    ['web', 'd-and-n-blog',       'd&n.blog',                 'http://dallasandnicole.com/'],

    ['print', 'guerilla-poster',      'Guerilla Poster',                lambda{|p| p.image_src :large }],
    ['print', 'moonlight-poster',     'Moonlight Poster',               lambda{|p| p.image_src :large }],
    ['print', 'mom-poster',           'Mom Poster',                     lambda{|p| p.image_src :large }],
    ['print', 'charm-poster',         'Charm Poster',                   lambda{|p| p.image_src :large }],
    ['print', 'mountain-ash-poster',  'Mountain Ash Poster',            lambda{|p| p.image_src :large }],
    ['print', 'mountain-ash',         'Mountain Ash 2004-05 & 2005-06', lambda{|p| p.image_src :large }],
    ['print', 't-shirts',             'T-Shirts',                       lambda{|p| p.image_src :large }],

    ['art', 'episode-73',     'Episode 73',     lambda{|p| p.image_src :large }],
    ['art', 'flight',         'Flight',         lambda{|p| p.image_src :large }],
    ['art', 'bouquet',        'Bouquet',        lambda{|p| p.image_src :large }],
    ['art', 'flowers',        'Flowers',        lambda{|p| p.image_src :large }],
    ['art', 'stripes',        'Stripes',        lambda{|p| p.image_src :large }],
    ['art', 'lite-stripes',   'Lite Stripes',   lambda{|p| p.image_src :large }],
    ['art', 'bright-stripes', 'Bright Stripes', lambda{|p| p.image_src :large }],

    ['process',  'aswwc-radio',  'ASWWC Radio',  lambda{|p| p.image_src :large }]
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

    def art
      all.select {|p| p.category == 'art'}
    end

    def process
      all.select {|p| p.category == 'process'}
    end
  end

  def url
    case href
    when String then href
    when Proc   then href.call self
    end
  end

  def external?
    !!(url =~ %r{^http://})
  end

  def image_src(size = :thumb)
    "img/portfolio/#{category}/#{size}/#{slug}.jpg"
  end
end
