module ApplicationHelper
    def render_errors(object, method)
        err = object.errors[method]
        unless err.nil?
            err.map{ |e| e.to_s }.join
        end
    end
end
