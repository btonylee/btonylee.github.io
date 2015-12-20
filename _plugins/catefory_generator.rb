module Jekyll
  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category.html')
      self.data['category'] = category
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category'
        dir = 'categories'
        site.categories.each do |category|
            categoryEn = site.config['convert'][category.first]
            if categoryEn == nil
                categoryEn = category.first
            end
            site.pages << CategoryPage.new(site, site.source, File.join(dir, categoryEn), category)
        end
      end
    end
  end

end
