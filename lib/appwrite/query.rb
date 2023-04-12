module Appwrite
    class Query
        class << Query
            def equal(attribute, value)
                return add_query(attribute, "equal", value)
            end

            def not_equal(attribute, value)
                return add_query(attribute, "notEqual", value)
            end

            def less_than(attribute, value)
                return add_query(attribute, "lessThan", value)
            end
            
            def less_than_equal(attribute, value)
                return add_query(attribute, "lessThanEqual", value)
            end
            
            def greater_than(attribute, value)
                return add_query(attribute, "greaterThan", value)
            end
            
            def greater_than_equal(attribute, value)
                return add_query(attribute, "greaterThanEqual", value)
            end

            def is_null(attribute)
                return "isNull(\"#{attribute}\")"
            end

            def is_not_null(attribute)
                return "isNotNull(\"#{attribute}\")"
            end

            def between(attribute, start, ending)
                return add_query(attribute, "between", [start, ending])
            end

            def starts_with(attribute, value)
                return add_query(attribute, "startsWith", value)
            end

            def ends_with(attribute, value)
                return add_query(attribute, "endsWith", value)
            end

            def select(attributes)
                return "select([#{attributes.map {|attribute| "\"#{attribute}\""}.join(',')}])"
            end
            
            def search(attribute, value)
                return add_query(attribute, "search", value)
            end

            def order_asc(attribute)
                return "orderAsc(\"#{attribute}\")"
            end

            def order_desc(attribute)
                return "orderDesc(\"#{attribute}\")"
            end

            def cursor_before(id)
                return "cursorBefore(\"#{id}\")"
            end

            def cursor_after(id)
                return "cursorAfter(\"#{id}\")"
            end

            def limit(limit)
                return "limit(#{limit})"
            end

            def offset(offset)
                return "offset(#{offset})"
            end

            private

            def add_query(attribute, method, value)
                if value.is_a?(Array)
                    "#{method}(\"#{attribute}\", [#{value.map {|item| parseValues(item)}.join(',')}])"
                else
                   return "#{method}(\"#{attribute}\", [#{parseValues(value)}])"
				end
            end

            def parseValues(value)
                return value.is_a?(String) ? "\"#{value}\"" : value
            end
        end
    end
end