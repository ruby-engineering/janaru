# frozen_string_literal: true

class ArticlePolicy
  attr_reader :resource, :record

  def initialize(resource, record)
    @resource = resource
    @record = record
  end

  def destroy?
    resource.admin?
  end

  def publish?
    resource.admin?
  end

  def unpublish?
    resource.admin?
  end
end
