class Thing < ActiveRecord::Base
  before_create :thingify
  before_create :urify


  def relations(predicate = nil)
    Relation.with_predicate(predicate).find_all_by_subject_url(url) +
    Relation.with_predicate(predicate).find_all_by_object_url(url)
  end

  def thingify
    self.attributes = Thingify.get(url)
  end

  def urify
    self.uri ||= url
  end

  def representation
    attributes.slice(*%w[ url name image_url ]).reject { |k,v| v.nil? }
  end

  def as_json(options = nil)
    { "thing" => representation }.as_json(options)
  end
end
