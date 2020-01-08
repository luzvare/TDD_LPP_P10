require './lib/huellanutricional'

RSpec.describe Menu do

	before :all do
		##Platos DSL

		@plato_ejemplo = Plato.new("Hamburguesa") do 
			nombre "Hamburguesa especial de la casa" 
			alimento :descripcion => "carne de vaca", 
					:gramos => 1000,
					:proteinas => 21.1,
					:hidratos => 0.0 ,
					:lipidos => 3.1,
					:gei => 50.0,
					:terreno => 164.0
			alimento :descripcion => "huevo", 
					:gramos => 1000 ,
					:proteinas => 13.0,
					:hidratos => 1.1,
					:lipidos => 11.0,
					:gei => 4.2,
					:terreno => 5.7 
		end

		@menu_ejemplo = Menu.new("Combinado no. 1") do 
			descripcion "hamburguesa, papas, refresco" 
			componente 	:descripcion => "Hamburguesa especial de la casa", 
						:precio => 4.25
			componente 	:descripcion => "Papas pequenias", 
						:precio => 1.75 
			componente 	:descripcion => "Refrescos de lata o cerveza", 
						:precio => 1.50 
			precio 7.50 
		end		

	end

	context "#DSL" do
	
		it "Crea un plato"	 do
			
			expect(
				Plato.new("Hamburguesa") do 
					nombre "Hamburguesa especial de la casa" 
					alimento :descripcion => "carne de vaca", 
							:gramos => 1000,
							:proteinas => 21.1,
							:hidratos => 0.0 ,
							:lipidos => 3.1,
							:gei => 50.0,
							:terreno => 164.0
					alimento :descripcion => "huevo", 
							:gramos => 1000 ,
							:proteinas => 13.0,
							:hidratos => 1.1,
							:lipidos => 11.0,
							:gei => 4.2,
							:terreno => 5.7 
				end
			)

		end

		
		it "Muestra el plato formateado" do
			expect(@plato_ejemplo.to_s)
		end

		it "Crea un menú" do

			expect(
				Menu.new("Combinado no. 1") do 
				descripcion "hamburguesa, papas, refresco" 
				componente 	:descripcion => "Hamburguesa especial de la casa", 
							:precio => 4.25
				componente 	:descripcion => "Papas pequenias", 
							:precio => 1.75
				componente 	:descripcion => "Refrescos de lata", 
							:precio => 1.50
				precio 7.50 
				end
			)
		end

		it "Muestra el menú formateado" do
			expect(@menu_ejemplo.to_s)
		end

	end

end


  
