# Clase que representa a un alimento
# @author Luciana Varela <alu0101106175@ull.edu.es>
class Alimento

	include Comparable

	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terrenousado

	# Crea una instancia de un Alimento
	# @param alimento Hash que contiene todo lo necesario para instanciar un alimento
	# @return [Alimento] Objeto de la clase Alimento
	# @example Crear un objeto de la clase alimento
	# 			@nuez = {"nombre" => "Nuez"            , "proteinas" => 20.0, "carbohidratos" => 21.0, "lipidos" => 54.0, "gei" => 0.3 , "terrenousado" => 7.9}
	# 			@alimentonuez = Alimento.new(@nuez)
	def initialize(alimento)
		@nombre        = alimento["nombre"]
		@proteinas     = alimento["proteinas"]
		@carbohidratos = alimento["carbohidratos"]
		@lipidos       = alimento["lipidos"]
		@gei           = alimento["gei"]
		@terrenousado  = alimento["terrenousado"] 
	end

	# Mostrar el Alimento formateado
	# @return [nil]
	def to_s
		puts "{#{@nombre} => Proteínas: #{@proteinas} Carbohidratos: #{@carbohidratos} Lípidos: #{@lipidos} GEI: #{@gei} Terreno usado: #{@terrenousado}}"
	end

	# Calcular el impacto ambiental de un alimento
	# @return [Array] Gases de efecto invernadero y el terreno que usa el alimento
	def impacto_ambiental
		array_impacto = [@gei, @terrenousado]
		return array_impacto
	end
	# Calcular el valor energético en calorías de un alimento
	# @return [Number] Calorías que aporta un alimento
	def valor_energetico
		calorias = ((@proteinas * 4) + (@lipidos * 9) + (@carbohidratos * 4)).round(4)
		return calorias
	end

	# Sumar dos instancias de la clase Alimento
	# @param other Otro objeto de la clase Alimento
	# @return [Alimento] Objeto de la clase Alimento con los nuevos valores
	def +(other)
		if other.instance_of? Alimento
			resultado = {"nombre" => "Alimento", "proteinas" => @proteinas+other.proteinas, "carbohidratos" => @carbohidratos+other.carbohidratos, "lipidos" => @lipidos+other.lipidos, "gei" => @gei+other.gei , "terrenousado" => @terrenousado+other.terrenousado}
		    	Alimento.new(resultado)	
		end
	end

	# Método para hacer funcionar el módulo comparable
	# @param other Otra instancia de alimento
	# @return [Boolean] Devuelve si un Alimento es mayor, menor o igual que otro alimento
	def <=>(other)
		if other == nil
			return nil
		else
			valor_energetico <=> other.valor_energetico
		end
	end
end
