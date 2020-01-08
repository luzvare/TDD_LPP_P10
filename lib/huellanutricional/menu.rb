 class Menu

    attr_reader :nombre, :descripcion, :componentes, :precio, :platos

	def initialize(nombre, &block)
        @nombre = nombre
        @componentes = []
        @platos = []
		if block_given?  
			if block.arity == 1
			  yield self
			else
			 instance_eval(&block) 
			end
		end
    end
    
    def descripcion (nombre)
        @descripcion = nombre
    end

    def componente(opciones)
        descripcion = opciones[:descripcion]
        precio = opciones[:precio]
        plato = plato_del_menu(descripcion)
        componente = [descripcion,precio]
        @componentes << componente
        @platos << plato
    end

    def precio(numero)
        @precio = numero
    end

    def plato_del_menu(descripcion)
    
        case descripcion
        when "Hamburguesa especial de la casa"
            plato1 = Plato.new("Hamburguesa") do 
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
            return plato1
        when "Papas pequenias"
            plato2 = Plato.new("Papas") do 
                nombre "Papas pequenias con huevo" 
                alimento :descripcion => "papas fritas", 
                        :gramos => 1000,
                        :proteinas => 36,
                        :hidratos => 340 ,
                        :lipidos => 110,
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
            return plato2
        when "Refrescos de lata o cerveza"
            plato3 = Plato.new("Refresco") do 
                nombre "Refresco o cerveza" 
                alimento 	:descripcion => "cerveza", 
                            :gramos => 1000,
                            :proteinas => 0.5,
                            :hidratos => 3.6 ,
                            :lipidos => 0.0,
                            :gei => 0.24,
                            :terreno => 0.22
            end
            return plato3
        end

    end

    def to_s 

        salida = "Menú : #{@nombre}\nDescripción: #{@descripcion}\n"
        salida << "Platos del menú y precios\n"
        salida << "#{@componentes}\n"
        salida << "Información de #{@componentes[0][0]} :  proteínas - #{@platos[0].pproteinas}, lípidos - #{@platos[0].plipidos} , hidratos - #{@platos[0].phidratos}\n"
        salida << "Información de #{@componentes[1][0]} :  proteínas - #{@platos[1].pproteinas}, lípidos - #{@platos[1].plipidos} , hidratos - #{@platos[1].phidratos}\n"
        salida << "Información de #{@componentes[2][0]} :  proteínas - #{@platos[2].pproteinas}, lípidos - #{@platos[2].plipidos} , hidratos - #{@platos[2].phidratos}\n"


        
        salida << "Precio del menú: #{@precio}"
        return salida
    end

 end