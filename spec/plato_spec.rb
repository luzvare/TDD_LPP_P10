require './lib/huellanutricional'

RSpec.describe Lista do
    before :all do

		##Especificaciones de los alimentos, que están almacenados en hashes

	    @carneVaca    = {"nombre" => "Carne de Vaca"   , "proteinas" => 21.1, "carbohidratos" => 0.0 , "lipidos" => 3.1 , "gei" => 50.0, "terrenousado" => 164.0}
		@carneCordero = {"nombre" => "Carne de Cordero", "proteinas" => 18.0, "carbohidratos" => 0.0 , "lipidos" => 17.0, "gei" => 20.0, "terrenousado" => 185.0}
		@camarones    = {"nombre" => "Camarones"       , "proteinas" => 17.6, "carbohidratos" => 1.5 , "lipidos" => 0.6 , "gei" => 18.0, "terrenousado" => 2.0}
		@chocolate    = {"nombre" => "Chocolate"       , "proteinas" => 5.3 , "carbohidratos" => 47.0, "lipidos" => 30.0, "gei" => 2.3 , "terrenousado" => 3.4}
		@salmon       = {"nombre" => "Salmon"          , "proteinas" => 19.9, "carbohidratos" => 0.0 , "lipidos" => 13.6, "gei" => 6.0 , "terrenousado" => 3.7}
		@cerdo        = {"nombre" => "Cerdo"           , "proteinas" => 0.0 , "carbohidratos" => 0.0 , "lipidos" => 6.3 , "gei" => 7.6 , "terrenousado" => 11.0}
		@pollo        = {"nombre" => "Pollo"           , "proteinas" => 20.6, "carbohidratos" => 0.0 , "lipidos" => 5.6 , "gei" => 5.7 , "terrenousado" => 7.1}
		@queso        = {"nombre" => "Queso"           , "proteinas" => 25.0, "carbohidratos" => 1.3 , "lipidos" => 33.0, "gei" => 11.0, "terrenousado" => 41.0}
		@cerveza      = {"nombre" => "Cerveza"         , "proteinas" => 0.5 , "carbohidratos" => 3.6 , "lipidos" => 0.0 , "gei" => 0.24, "terrenousado" => 0.22}
		@lecheVaca    = {"nombre" => "Leche de vaca"   , "proteinas" => 3.3 , "carbohidratos" => 4.8 , "lipidos" => 3.2 , "gei" => 3.2 , "terrenousado" => 8.9}
		@huevos       = {"nombre" => "Huevos"          , "proteinas" => 13.0, "carbohidratos" => 1.1 , "lipidos" => 11.0, "gei" => 4.2 , "terrenousado" => 5.7}
		@cafe         = {"nombre" => "Café"            , "proteinas" => 0.1 , "carbohidratos" => 0.0 , "lipidos" => 0.0 , "gei" => 0.4 , "terrenousado" => 0.3}
		@tofu         = {"nombre" => "Tofu"            , "proteinas" => 8.0 , "carbohidratos" => 1.9 , "lipidos" => 4.8 , "gei" => 2.0 , "terrenousado" => 2.2}
		@lentejas     = {"nombre" => "Lentejas"        , "proteinas" => 23.5, "carbohidratos" => 52.0, "lipidos" => 1.4 , "gei" => 0.4 , "terrenousado" => 3.4}
		@nuez         = {"nombre" => "Nuez"            , "proteinas" => 20.0, "carbohidratos" => 21.0, "lipidos" => 54.0, "gei" => 0.3 , "terrenousado" => 7.9}

		##Creación de los alimentos, pasando ese hash a la clase alimento

		@alimentovaca      = Alimento.new(@carneVaca)
		@alimentocordero   = Alimento.new(@cerdo)
		@alimentocamarones = Alimento.new(@camarones)
		@alimentochocolate = Alimento.new(@chocolate)
		@alimentosalmon    = Alimento.new(@salmon)
		@alimentocerdo     = Alimento.new(@cerdo)	
		@alimentopollo     = Alimento.new(@pollo)
		@alimentoqueso     = Alimento.new(@queso)
		@alimentocerveza   = Alimento.new(@cerveza)
		@alimentoleche     = Alimento.new(@lecheVaca)
		@alimentohuevos    = Alimento.new(@huevos)
		@alimentocafe      = Alimento.new(@cafe)
		@alimentotofu      = Alimento.new(@tofu)
		@alimentolentejas  = Alimento.new(@lentejas)
		@alimentonuez      = Alimento.new(@nuez)

		##Creando las listas de alimentos

	    @listaAlimentos = Lista.new;
		insertar = Node.new(@alimentovaca,nil,nil);
		insertar2 = Node.new(@alimentosalmon,nil,nil);
		@listaAlimentos.insertar(insertar)	
		@listaAlimentos.insertar(insertar2)
	
		@listaEspaniola = Lista.new
		@listaEspaniola.insertar(@alimentocordero)
		@listaEspaniola.insertar(@alimentolentejas)
		@listaEspaniola.insertar(@alimentotofu)

		@listaVasca = Lista.new
		@listaVasca.insertar(@alimentovaca)
		@listaVasca.insertar(@alimentocerveza)
		@listaVasca.insertar(@alimentohuevos)

		@listaVegetaria = Lista.new
		@listaVegetaria.insertar(@alimentoleche)
		@listaVegetaria.insertar(@alimentohuevos)
		@listaVegetaria.insertar(@alimentoleche)
		@listaVegetaria.insertar(@alimentotofu)	
		@listaVegetaria.insertar(@alimentoleche)

		@listaVegana = Lista.new
		@listaVegana.insertar(@alimentocafe)
		@listaVegana.insertar(@alimentotofu)
		@listaVegana.insertar(@alimentolentejas)
		@listaVegana.insertar(@alimentonuez)

		@listaCarne = Lista.new
		@listaCarne.insertar(@alimentovaca)
		@listaCarne.insertar(@alimentocerdo)
		@listaCarne.insertar(@alimentopollo)

		##Platos que conforman una dieta

		@platosEspania = Lista.new
		@platosEspania.insertar(@alimentoleche)
		@platosEspania.insertar(@alimentohuevos)
		@espaniaCantidad = [1000,1000]
		@huevosRevueltos = PlatoEE.new("Huevos revueltos", @platosEspania, @espaniaCantidad)

		@platosEspania2 = Lista.new
		@platosEspania2.insertar(@alimentopollo)
		@platosEspania2.insertar(@alimentonuez)
		@platosEspania2.insertar(@alimentoleche)
		@espaniaCantidad2 = [1000,1000,1000]
		@polloSalsa = PlatoEE.new("Pollo con salsa de nueces", @platosEspania2, @espaniaCantidad2)

		@platosVascos = Lista.new
		@platosVascos.insertar(@alimentohuevos)
		@platosVascos.insertar(@alimentocerdo)
		@platosVascos.insertar(@alimentocerveza)
		@vascoCantidad = [1000,1000,1000]
		@huevosycerveza = PlatoEE.new("Huevos estrellados y cerveza", @platosVascos, @vascoCantidad)

		@platosVascos2 = Lista.new
		@platosVascos2.insertar(@alimentovaca)
		@platosVascos2.insertar(@alimentocerdo)
		@platosVascos2.insertar(@alimentopollo)
		@vascoCantidad2 = [1000,1000,1000]
		@cocido = PlatoEE.new("Cocido", @platosVascos2, @vascoCantidad2)

		@platosVegetarianos = Lista.new
		@platosVegetarianos.insertar(@alimentoleche)
		@platosVegetarianos.insertar(@alimentochocolate)
		@vegeCantidad = [1000,1000]
		@chocolateleche = PlatoEE.new("Chocolate con leche", @platosVegetarianos, @vegeCantidad)

		@platosVegetarianos2 = Lista.new
		@platosVegetarianos2.insertar(@alimentoqueso)
		@platosVegetarianos2.insertar(@alimentohuevos)
		@vegeCantidad2 = [1000,1000]
	    @huevoqueso = PlatoEE.new("Revuelto con queso", @platosVegetarianos2, @vegeCantidad2)	

		@platosVeganos = Lista.new
		@platosVeganos.insertar(@alimentotofu)
		@platosVeganos.insertar(@alimentonuez)
		@vegaCantidad = [1000,1000]
		@tofunuez = PlatoEE.new("Tofu con salsa de nueces", @platosVeganos, @vegaCantidad)

		@platosVeganos2 = Lista.new
		@platosVeganos2.insertar(@alimentolentejas)
		@platosVeganos2.insertar(@alimentotofu)
		@vegaCantidad2 = [1000,1000]
		@lentejasveganas = PlatoEE.new("Lentejas veganas", @platosVeganos2, @vegaCantidad2)

		@platosCarne = Lista.new
		@platosCarne.insertar(@alimentovaca)
		@platosCarne.insertar(@alimentocerdo)
		@platosCarne.insertar(@alimentolentejas)
		@carneCantidad = [1000,1000,1000]
		@lentejascarne = PlatoEE.new("Lentejas de carne", @platosCarne, @carneCantidad)


		@platosCarne2 = Lista.new
		@platosCarne2.insertar(@alimentocordero)
		@platosCarne2.insertar(@alimentopollo)
		@platosCarne2.insertar(@alimentovaca)
		@carneCantidad2 = [1000,1000,1000]
		@pinchoscarne = PlatoEE.new("Pinchos de carne", @platosCarne2, @carneCantidad2)

		##Dietas de cada tipo 

		@dietaEspania = Lista.new
		@dietaEspania.insertar(@huevosRevueltos)
		@dietaEspania.insertar(@polloSalsa)

		@dietaVasca = Lista.new
		@dietaVasca.insertar(@huevosycerveza)
		@dietaVasca.insertar(@cocido)

		@dietaVegetariana = Lista.new
		@dietaVegetariana.insertar(@chocolateleche)
		@dietaVegetariana.insertar(@huevoqueso)

		@dietaVegana = Lista.new
		@dietaVegana.insertar(@tofunuez)
		@dietaVegana.insertar(@lentejasveganas)

		@dietaCarnivora = Lista.new
		@dietaCarnivora.insertar(@lentejascarne)
		@dietaCarnivora.insertar(@pinchoscarne)

		##Menú dietético

		@menudietetico = [@lentejasveganas, @pinchoscarne, @huevoqueso]
		@menudieteticoprecios = [8.0, 4.0, 4.0] ##precios en euros


    end


	context "#Creando herencia y utilizando módulos" do

        it "Haciendo comparable la clase alimento" do
            expect(@alimentocafe < @alimentocamarones).to eq(true)
            expect(@alimentocafe <= @alimentocamarones).to eq(true)
            expect(@alimentocafe == @alimentocamarones).to eq(false)
            expect(@alimentocafe == @alimentocafe).to eq(true)
            expect(@alimentocafe > @alimentocamarones).to eq(false)
            expect(@alimentocafe >= @alimentocamarones).to eq(false)
            expect(@alimentocerdo.between?(@alimentocafe, @alimentocordero)).to eq(true)
        end

        it "Haciendo enumerable la clase lista" do
            #expect(@listaEspaniola.collect { |alimento| puts "#{alimento}+" })
            alimentosprueba = [@alimentocerdo, @alimentolentejas, @alimentotofu]
            i = 0
            @listaEspaniola.select do |alimento|
                expect(alimento.value).to eq(alimentosprueba[i])
                i += 1
            end
            expect(@listaEspaniola.max.value).to eq(@alimentolentejas)
            expect(@listaEspaniola.min.value).to eq(@alimentocerdo)
            expect(@listaEspaniola.sort{ |a,b| b <=> a })
        end

        it "Creando la clase Plato" do
            expect(@huevosRevueltos.nombreplato)
            expect(@huevosRevueltos.alimentos).to eq(@huevosRevueltos.alimentos)
            expect(@huevosRevueltos.cantidadesalimentos).to eq([1000,1000])
            expect(@huevosRevueltos.pproteinas).to eq([20.25, 79.75])
            expect(@huevosRevueltos.plipidos).to eq([22.54, 77.46])
            expect(@huevosRevueltos.phidratos).to eq([81.36, 18.64])
            expect(@huevosRevueltos.vct).to eq(216.6)
            #expect(@huevosRevueltos.to_s)	
        end

        it "Creando la clase PlatoEE" do
            expect(@huevosRevueltos.emisiones).to eq(7.4)
            expect(@huevosRevueltos.terreno).to eq(14.6)
            #expect(@huevosRevueltos.to_s)
            expect(@huevosRevueltos.is_a?Plato).to eq(true)
            expect(@huevosRevueltos.instance_of?Plato).to eq(false)
            expect(@huevosRevueltos.kind_of?PlatoEE).to eq(true)
        end

        it "Haciendo comparables las clases de platos" do
            expect(@dietaEspania[0] > @dietaVasca[0]).to eq(false)			
            expect(@dietaEspania[0] < @dietaVegetariana[0] ).to eq(false)
            expect(@dietaEspania[0] != @dietaVegetariana[0] ).to eq(false)
            expect(@dietaEspania[0] == @dietaVegetariana[0] ).to eq(true)

            expect(@dietaVegana[0].between?(@dietaEspania[0], @dietaVasca[0])).to eq(false)

        end

        it "Enumerando dietas" do
            expect(@dietaVegana.max.value).to eq(@tofunuez)
            expect(@dietaVegetariana.min.value).to eq(@chocolateleche)
            expect(@dietaEspania.sort)
            expect(@dietaVasca.select)
            expect(@dietaCarnivora.collect)		
        end
    end
    

	context "#menú dietético" do

		it "Array de platos" do 
			expect(@menudietetico.instance_of?Array).to eq(true)
			expect(@menudieteticoprecios).to eq([8.0,4.0,4.0])
			expect(@menudietetico[0].huella_nutricional).to eq(1)
			expect(@menudietetico[1].huella_nutricional).to eq(2)
			expect(@menudietetico[2].huella_nutricional).to eq(2)
		end
			
		it "Plato con máxima huella nutricional" do
			expect(@menudietetico.max).to eq(@huevoqueso)
		end

		it "Aumentar el precio en proporción a la del plato con máxima huella" do
			total  =  @menudieteticoprecios.inject(0) { |precio, suma| precio + suma}
			indice_maximo = @menudietetico.map.with_index { |elemento, indice| indice if elemento == @menudietetico.max }.compact
			porcentaje_maximo = @menudieteticoprecios[indice_maximo[0]]*100/total 
			@menudieteticoprecios = @menudieteticoprecios.map { |precio| precio + precio*(porcentaje_maximo/100) }
			expect(@menudieteticoprecios).to eq([10.0,5.0,5.0])
		end

	end


end
