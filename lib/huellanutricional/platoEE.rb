# Clase que representa un plato que además tiene valores de emisiones y terreno usados
# @author Luciana Varela Díaz <alu0101106175@ull.edu.es>
class PlatoEE < Plato

        attr_reader :vtemisiones, :veterreno

        # Crea una instancia de un PlatoEE
        # @param nombre  [String] Nombre del plato
        # @param alimentos [Lista] Conjunto de alimentos que conforman el plato
        # @param cantidadesalimentos [Array] La cantidad del alimento que conforma el plato en gramos
        # @return [PlatoEE] Un objeto nuevo de la clase Plato
        # @example Crear un objeto de plato con una lista ya creada
        #	pinchoscarne = PlatoEE.new("Pinchos de carne", platosCarne2, carneCantidad2)
        def initialize(nombre,alimentos,cantidadesalimentos)
                super(nombre,alimentos,cantidadesalimentos)
                @vtemisiones = emisiones
                @veterreno   = terreno
        end

        # Cálculo de las emisiones de efecto invernadero
        # @return [Number] Calculamos las emisiones de gases de efecto invernadero del plato
        def emisiones
                auxiliar = 0
                for alimento in @alimentos
                        auxiliar += alimento.value.gei
                end
                return auxiliar.round(2)
        end

        # Cálculo del terreno estimado que utilizaría el Plato
        # @return [Number]  Estimación del terreno usado
        def terreno
                auxiliar = 0
                for alimento in @alimentos
                        auxiliar += alimento.value.terrenousado
                end
                return auxiliar.round(2)
        end

	# Calcular la huella nutricional del plato
	# @return [Number] Devuelve la huella nutricional del plato
	def huella_nutricional 
		
		impactoEnergia = impacto_energia
		impactoCarbono =  impacto_huella

		return (impactoEnergia+impactoCarbono)/2;

        end
        
	# Calcular el impacto de la huella de carbono del plato
	# @return [Number] Devuelve el índice de la huella de carbono del plato 
	def impacto_huella

		valor_medio = @vtemisiones*1000/self.alimentos.largo

		if valor_medio < 800
			return 1
		elsif  valor_medio > 1200
			return 3
		else
			return 2
		end

	end

        # Muestra el plato formateado
        # @return [nil]
        def to_s
                s = "( "
                s << super.to_s        
                s << "\nGEI: #{vtemisiones} \n Terreno aproximado: #{veterreno} )"
                s
        end

        # Para que funcione el módulo comparable
        # @note Para hacer esto invocamos al <=> de la clase padre
        # @param other Instancia de otro Plato para comparar
        # @return [Boolean] Deuelve si un plato es mayor,menor o igual que el otro
        def <=> (other)
                super
        end 
end
