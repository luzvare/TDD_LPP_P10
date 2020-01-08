require './lib/huellanutricional'

RSpec.describe Lista do
    before :all do
        
	    @carneVaca    = {"nombre" => "Carne de Vaca"   , "proteinas" => 21.1, "carbohidratos" => 0.0 , "lipidos" => 3.1 , "gei" => 50.0, "terrenousado" => 164.0}
		@salmon       = {"nombre" => "Salmon"          , "proteinas" => 19.9, "carbohidratos" => 0.0 , "lipidos" => 13.6, "gei" => 6.0 , "terrenousado" => 3.7}
		@pollo        = {"nombre" => "Pollo"           , "proteinas" => 20.6, "carbohidratos" => 0.0 , "lipidos" => 5.6 , "gei" => 5.7 , "terrenousado" => 7.1}

		##Creación de los alimentos, pasando ese hash a la clase alimento
        
        @alimentovaca      = Alimento.new(@carneVaca)
		@alimentosalmon    = Alimento.new(@salmon)
		@alimentopollo     = Alimento.new(@pollo)

	    @listaAlimentos = Lista.new;
		insertar = Node.new(@alimentovaca,nil,nil);
		insertar2 = Node.new(@alimentosalmon,nil,nil);
		@listaAlimentos.insertar(insertar)	
		@listaAlimentos.insertar(insertar2)

    end

    context "#Añadiendo lista doblemente enlazada" do
		
        it "Crear clase nodo" do
            expect(Node.new)
        end

        it "Crear clase Lista" do
            expect(Lista.new) 
        end

        it "Insertar un nodo" do
            insertar = Node.new;
            epa = Lista.new;
            expect(epa.insertar(insertar))
        end    


        it "Extraer el primer elemento de la lista" do
            expect(@listaAlimentos.extraerHead)	
        end

        it "Extraer el último elemento de la lista" do
            expect(@listaAlimentos.extraerTail)
        end 

        it "Insertar varios elementos en la lista" do

            prueba = Node.new(@alimentosalmon,nil,nil)
            @listaAlimentos.insertar(prueba)
            prueba = Node.new(@alimentopollo,nil,nil)     
            @listaAlimentos.insertar(prueba)
            #@listaAlimentos.to_s        
        end

    end 
end