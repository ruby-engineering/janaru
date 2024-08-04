module MenuHelper
  def menu_link_class(link_path, alternative_path = nil)
    links = [link_path, alternative_path].compact

    if links.any? { |link| link == request.path } || (link_path != '/' && request.path.starts_with?(link_path))
      'p-2 flex items-center text-sm text-blue-600 hover:text-blue-600 focus:outline-none focus:text-blue-600'
    else
      'p-2 flex items-center text-sm text-gray-800 hover:text-gray-500 focus:outline-none focus:text-gray-500'
    end
  end
end
