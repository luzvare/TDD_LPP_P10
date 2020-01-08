require './lib/huellanutricional'

RSpec.describe Alimento do

    before :all do
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
    end

    context '#Clase alimento' do

        it "Debe existir un nombre para el alimento" do
        expect(@alimentovaca.nombre)
        end
        it "Debe existir proteinas en el alimento" do
        expect(@alimentovaca.proteinas)
        end
        it "Debe existir carbohidratos en el alimento" do
        expect(@alimentovaca.carbohidratos)
        end
        it "Debe existir lipidos en el alimento" do
        expect(@alimentovaca.lipidos)
        end
        it "Debe existir GEI en el alimento" do
            expect(@alimentovaca.gei)
        end
        it "Debe existir terrenousado en el alimento" do
        expect(@alimentovaca.terrenousado)
        end
        it "Debe poder instanciarse el alimento" do
            expect(Alimento.new(@carneVaca))
        end
        it "Debe poder verse los valores del alimento" do
            expect(@alimentovaca.nombre).to eq("Carne de Vaca")
            expect(@alimentovaca.proteinas).to eq(21.1)
            expect(@alimentovaca.carbohidratos).to eq(0.0)
            expect(@alimentovaca.lipidos).to eq(3.1)
            expect(@alimentovaca.gei).to eq(50.0)
            expect(@alimentovaca.terrenousado).to eq(164.0)
            expect(@alimentovaca.valor_energetico)
        end
        it "Debe mostrarse el alimento formateado" do
            #expect(@alimentovaca.to_s)
        end

    end

	context "#Cálculo de impacto" do

		it "Obtener impacto_ambiental" do
			expect(@alimentovaca.impacto_ambiental)
		end

		it "Obtener impacto_ambiental de un hombre" do	
			dieta = [@alimentosalmon,@alimentopollo,@alimentocamarones]
			hombre = Persona.new("masculino", dieta)
			resultado = hombre.calcular_impacto_dieta
		end

		it "Obtener impacto_ambiental de una mujer" do
		
			dieta = [@alimentosalmon,@alimentopollo,@alimentocamarones]
			mujer = Persona.new("femenino", dieta)
			resultado = mujer.calcular_impacto_dieta
		end

	end

    

	context "#Expectativas para las dietas" do

    it "Gases de efecto invernadero diarios" do
        
        persona = Persona.new("hombre", @listaVasca)
        resultado = persona.calcular_impacto_dieta
        expect(resultado[0].round(1)).to eq(54.4)

        persona = Persona.new("hombre", @listaEspaniola)
        resultado = persona.calcular_impacto_dieta	
        expect(resultado[0].round(1)).to eq(10.0)

        persona = Persona.new("hombre", @listaVegetaria)
        resultado = persona.calcular_impacto_dieta
        expect(resultado[0].round(1)).to eq(15.8)
        
        persona = Persona.new("hombre", @listaVegana)
        resultado = persona.calcular_impacto_dieta
        expect(resultado[0].round(1)).to eq(3.1)
        
        persona = Persona.new("hombre", @listaCarne)
        resultado = persona.calcular_impacto_dieta
        expect(resultado[0].round(1)).to eq(63.3)
    end

    it "Gases de efecto invernadero anuales" do
            
        persona = Persona.new("hombre", @listaEspaniola)
        resultado = persona.calcular_impacto_dieta	
        expect(365*resultado[0].round(1)).to eq(3650.0)

        persona = Persona.new("hombre", @listaVasca)
        resultado = persona.calcular_impacto_dieta
        expect(365*resultado[0].round(1)).to eq(19856.0)

        persona = Persona.new("hombre", @listaVegetaria)
        resultado = persona.calcular_impacto_dieta
        expect(365*resultado[0].round(1)).to eq(5767.0)
        
        persona = Persona.new("hombre", @listaVegana)
        resultado = persona.calcular_impacto_dieta
        expect(365*resultado[0].round(1)).to eq(1131.5)
        
        persona = Persona.new("hombre", @listaCarne)
        resultado = persona.calcular_impacto_dieta
        expect(365*resultado[0].round(1)).to eq(23104.5)
    end

    it "Uso de terreno para cada dieta" do 
            
        persona = Persona.new("hombre", @listaEspaniola)
        resultado = persona.calcular_impacto_dieta	
        expect(resultado[1].round(1)).to eq(16.6)

        persona = Persona.new("hombre", @listaVasca)
        resultado = persona.calcular_impacto_dieta
        expect(resultado[1].round(1)).to eq(169.9)

        persona = Persona.new("hombre", @listaVegetaria)
        resultado = persona.calcular_impacto_dieta
        expect(resultado[1].round(1)).to eq(34.6)

        
        persona = Persona.new("hombre", @listaVegana)
        resultado = persona.calcular_impacto_dieta
        expect(resultado[1].round(1)).to eq(13.8)

        
        persona = Persona.new("hombre", @listaCarne)
        resultado = persona.calcular_impacto_dieta
        expect(resultado[1].round(1)).to eq(182.1)

    end

end

end