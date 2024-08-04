# frozen_string_literal: true

class TagPolicy
  attr_reader :resource, :record

  def initialize(resource, record)
    @resource = resource
    @record = record
  end

  def index?
    resource.admin?
  end

  def show?
    resource.admin?
  end

  def update?
    resource.admin?
  end

  def edit?
    resource.admin?
  end

  def create?
    resource.admin?
  end

  def new?
    resource.admin?
  end

  def destroy?
    resource.admin?
  end
end
