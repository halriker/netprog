class MachineSearchTerm
	attr_reader :where_clause, :where_args, :order
	def initialize(search_term)
		search_term = search_term.downcase
		@where_clause = ""
		@where_args = {}
		if search_term =~ /@/
			build_for_ip_search(search_term)
		else 
			build_for_machname_search(search_term)
		end
	end

private 

	def build_for_machname_search(search_term)
		@where_clause << case_insensative_search(:machine_name)
		@where_args[:machine_name] = starts_with(search_term)

		@order = "machine_name asc"
	end

	def starts_with(search_term)
		search_term + "%"
	end

	def case_insensative_search(field_name)
		"lower(#{field_name}) like :#{field_name}"
	end

	def extract_name(email)
		email.gsub(/@.*$/,'').gsub(/[0-9]+/,'')
	end


	def build_for_ip_search(search_term)
		@where_clause << case_insensitive_search(:ip_address)
		@where_args[:first_name] = starts_with(extract_name(search_term))

		@order = "lower(machine_name) = " + ActiveRecord::Base.connection.quote(search_term) + " desc, ip_address asc"
	end
end