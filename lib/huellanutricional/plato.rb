# Clase que representa un plato
# @author Luciana Varela Díaz <alu0101106175@ull.edu.es>
class Plato
	include Comparable

	attr_reader :nombreplato, :alimentos, :cantidadesalimentos,:valoresalimento, :pproteinas, :plipidos, :phidratos, :vct, :hayblock

	# Crea una instancia de un Plato
	# @param nombre  [String] Nombre del plato
	# @param alimentos [Lista] Conjunto de alimentos que conforman el plato
	# @param cantidadesalimentos [Array] La cantidad del alimento que conforma el plato en gramos
	# @return [Plato] Un objeto nuevo de la clase Plato
	# @example Crear un objeto de plato con una lista ya creada
	#	pinchoscarne = Plato.new("Pinchos de carne", platosCarne2, carneCantidad2)
	def initialize(nombrerecibido, alimentos = nil,cantidadesalimentos = nil ,&block)
		if block_given?
			@nombreplato = nombre(nombrerecibido)
			@hayblock = true
			@alimentos = []
			@cantidadesalimentos = []
			@valoresalimento = []
			if block_given?  
				if block.arity == 1
				yield self
				else
				instance_eval(&block) 
				end
			end
			@pproteinas = porcentaje_proteinas
			@phidratos = porcentaje_carbono
			@plipidos = porcentaje_lipidos
			@vct = valor_calorico
		else
			@nombreplato = nombrerecibido
			@alimentos = alimentos
			@cantidadesalimentos = cantidadesalimentos
			@pproteinas = porcentaje_proteinas
			@plipidos = porcentaje_lipidos
			@phidratos = porcentaje_carbono
			@vct = valor_calorico
		end
	end

	def nombre(cad)
		@nombreplato = cad
	end

	def alimento(opciones = {})
		alimento = opciones[:descripcion]
		cantidad = opciones[:gramos]
		valoresalimento = [opciones[:proteinas], opciones[:hidratos], opciones[:lipidos], opciones[:gei], opciones[:terreno]]
		tipo = {"nombre" => alimento, "proteinas" => valoresalimento[0], "carbohidratos" => valoresalimento[1], "lipidos" =>valoresalimento[2], "gei" => valoresalimento[3] , "terrenousado" => valoresalimento[4]}
		alimento2 = Alimento.new(tipo)
		@alimentos << alimento2
		@cantidadesalimentos << cantidad
		@valoresalimento << valoresalimento
	end

	# Calcular el porcentaje de proteínas del que dispone este plato
	# @return [Number] Devuelve el porcentaje de proteínas
	def porcentaje_proteinas
		proteinas  = 0
		i = 0
		for alimento in @alimentos
			if @hayblock
				proteinas += valoresalimento[i][0]
				i += 1
			else
				proteinas += alimento.value.proteinas
			end
		end

		aux = []
		i = 0
		for alimento in @alimentos
			if @hayblock
				aux << ((valoresalimento[i][0]/proteinas) * 100).round(2)
				i += 1
			else
				aux << ((alimento.value.proteinas/proteinas) * 100).round(2)
			end
		end
		if @hayblock 
			return proteinas
		end
		return aux
	end

	# Calcular el porcentaje de lípidos del que dispone este plato
	# @return [Number] Devuelve el porcentaje de lípidos
	def porcentaje_lipidos
		lipidos = 0
		i = 0
		for alimento in @alimentos
			if @hayblock
				lipidos += valoresalimento[i][2]
				i += 1
			else
				lipidos += alimento.value.lipidos
			end
		end
		aux = []
		i = 0
		for alimento in @alimentos
			if @hayblock
				aux << ((valoresalimento[i][2]/lipidos) * 100).round(2)
				i += 1
			else
				aux << ((alimento.value.lipidos/lipidos) * 100).round(2)
			end
		end
		if @hayblock
			return lipidos
		end
		return aux
	end

	# Calcular el porcentaje de hidratos de carbono del que dispone este plato
	# @return [Number] Devuelve el porcentaje de hidratos de carbono
	def porcentaje_carbono
		hidratos = 0
		i = 0
		for alimento in @alimentos
			if @hayblock
				hidratos += valoresalimento[i][1]
				i += 1
			else
				hidratos += alimento.value.carbohidratos
			end
		end
		aux = []
		i = 0
		for alimento in @alimentos
			if @hayblock
				aux << ((valoresalimento[i][1]/hidratos) * 100).round(2)
				i += 1
			else
				aux << ((alimento.value.carbohidratos/hidratos) * 100).round(2)
			end
		end
		if @hayblock
			hidratos
		end
		return aux
	end

	# Calcula el valor calórico del conjunto de alimentos que compone el plato
	#  @return [Number] Devuelve el valor calórico del plato
	def valor_calorico
		calorias = 0
		i = 0
		for alimento in @alimentos
			if @hayblock
				calorias += ((valoresalimento[i][0] * 4) + (valoresalimento[i][2] * 9) + (valoresalimento[i][1] * 4)).round(4)
				i += 1
			else
				calorias += alimento.value.valor_energetico
			end
		end
		return calorias.round(2)
	end

	# Calcular el impacto energético del plato
	# @return [Number] Devuelve el índice de impacto energético del plato 
	def impacto_energia
		
		valor_medio = @vct/@alimentos.largo

		if valor_medio < 670
			return 1
		elsif  valor_medio > 830 
			return 3
		else
			return 2
		end

	end

	# Muestra el plato formateado
	# @return [nil]
	def to_s
	        "Nombre del plato: #{@nombreplato}\n Alimentos: #{@alimentos} \n Cantidades en gramos: #{@cantidadesalimentos} \n Porcentajes proteínas #{@pproteinas} 
         	Porcentaje de carbohidratos: #{@phidratos} \n Porcentaje de lípidos: #{@plipidos} \n Valor calórico: #{@vct}"
	end

	# Para que funcione el módulo comparable
	# @param other Instancia de otro Plato para comparar
	# @return [Boolean] Deuelve si un plato es mayor,menor o igual que el otro
	def <=>(other)
		if other == nil
			return nil
		else
			huella_nutricional <=> other.huella_nutricional
		end
	end

end
