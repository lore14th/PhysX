-- PHYSX FOUNDATION -------------------------------------------------------------------------------
project "physx-foundation"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"physx/include/PxFoundation.h",
		"physx/include/foundation/*.h",
		"pxshared/include/foundation/*.h",
		"physx/source/foundation/src/*.cpp",
		"physx/source/foundation/include/*.h"
	}

	sysincludedirs
	{
		"physx/include",
		"pxshared/include",
		"physx/source/foundation/include"
	}

	defines 
	{
		"PX_PHYSX_STATIC_LIB",
		"PhysXFoundation_EXPORTS",
		"PX_PHYSX_FOUNDATION_EXPORTS",

		"_WINSOCK_DEPRECATED_NO_WARNINGS"
	}
	
	filter "system:windows"
		systemversion "latest"

		files
		{
			"pxshared/include/foundation/windows/*.h",
			"physx/source/foundation/src/windows/*.cpp",
			"physx/source/foundation/include/windows/*.h"
		}

	filter "system:macosx"
		files
		{
			"physx/source/foundation/src/unix/*.cpp",
			"pxshared/include/foundation/windows/*.h",
			"physx/source/foundation/include/unix/neon/*.h"
		}

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "Off"

-- PHYSX COMMON -----------------------------------------------------------------------------------
project "physx-common"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"physx/source/common/src/*.h",
		"physx/source/common/src/*.cpp",

		"physx/include/geomutils/*.h",
		"physx/source/geomutils/include/*.h",

		"physx/source/geomutils/**.h",
		"physx/source/geomutils/**.cpp",

		"physx/include/collision/*.h",
		"physx/include/collision/common/*.h",
		"physx/include/collision/geometry/*.h",
		"physx/source/compiler/resource_x64/PhysXCommon.rc"
	}

	sysincludedirs
	{
		"physx/include",
		"physx/include",

		"pxshared/include",

		"physx/source/geomutils",
		"physx/source/geomutils/src",
		"physx/source/geomutils/src/hf",
		"physx/source/geomutils/src/pcm",
		"physx/source/geomutils/src/mesh",
		"physx/source/geomutils/src/common",
		"physx/source/geomutils/src/contact",
		"physx/source/geomutils/src/intersection",
		"physx/source/geomutils/include",
		"physx/source/geomutils/src/gjk",
		"physx/source/geomutils/src/sweep",
		"physx/source/geomutils/src/convex",
		"physx/source/geomutils/src/distance",

		"physx/source/common/src",
		"physx/source/foundation/include"
	}

	links 
	{
		"physx-foundation"
	}

	defines 
	{
		"PX_PHYSX_STATIC_LIB",
		"PhysXCommon_EXPORTS",
		"PX_PHYSX_COMMON_EXPORTS",
	}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"physx/source/common/include/windows/*.h",
			"physx/include/collision/common/src/windows/*.cpp",
			"physx/include/collision/common/include/windows/*.h"
		}

	filter "system:macosx"
		files
		{
		}

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "Off"

-- PHYSX PVD SDK ----------------------------------------------------------------------------------
project "physx-pvdSDK"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"physx/include/pvd/**.h",
		
		"physx/source/filebuf/include/**.h",
		"physx/source/filebuf/include/**.inl",

		"physx/source/pvd/src/**.h",
		"physx/source/pvd/src/**.cpp",
		"physx/source/pvd/include/**.h"
	}

	sysincludedirs
	{
		"physx/include",
		"pxshared/include",
		"physx/source/pvd/include",
		"physx/source/filebuf/include",
		"physx/source/foundation/include"
	}

	links
	{
		"physx-foundation"
	}

	defines 
	{
		"PX_PHYSX_STATIC_LIB",
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "system:windows"
		systemversion "latest"
		
	--filter "system:macosx"

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "Off"

-- PHYSX COOKING ----------------------------------------------------------------------------------
project "physx-cooking"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"physx/include/cooking/*.h",

		"physx/source/physxcooking/src/*.h",
		"physx/source/physxcooking/src/*.cpp",
		"physx/source/physxcooking/src/mesh/*.h",
		"physx/source/physxcooking/src/mesh/*.cpp",
		"physx/source/physxcooking/src/convex/*.h",
		"physx/source/physxcooking/src/convex/*.cpp",

		"physx/source/compiler/resource_x64/PhysXCooking.rc"
	}

	sysincludedirs
	{
		"physx/include",
		"pxshared/include",
		"physx/source/physxcooking/src",
		"physx/source/physxcooking/src/mesh",
		"physx/source/physxcooking/src/convex",

		"physx/source/geomutils/src",
		"physx/source/geomutils/src/hf",
		"physx/source/geomutils/src/mesh",
		"physx/source/geomutils/src/common",
		"physx/source/geomutils/src/intersection",
		"physx/source/geomutils/include",
		"physx/source/geomutils/src/convex",

		"physx/source/common/src",
		"physx/source/common/include",
		"physx/source/foundation/include"
	}

	links
	{
		"physx-common",
	}

	defines 
	{
		"PX_PHYSX_STATIC_LIB",
		"PX_COOKING",
		"PX_PHYSX_FOUNDATION_EXPORTS",
		"PX_PHYSX_COMMON_EXPORTS",
		"PhysXCooking_EXPORTS",
		"PX_PHYSX_COOKING_EXPORTS",
		"PX_PHYSX_LOADER_EXPORTS",
		"PX_PHYSX_CORE_EXPORTS",
	}
	
	filter "system:windows"
		systemversion "latest"

		files
		{
			"physx/source/physxcooking/src/windows/*.cpp"
		}

	filter "system:macosx"
		files
		{
		}

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "Off"

-- PHYSX ------------------------------------------------------------------------------------------
project "physx"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		-- Low Level --
		"physx/source/lowlevel/**.h",
		"physx/source/lowlevel/**.cpp",

		-- Low Level AABB --
		"physx/source/lowlevelaabb/**.h",
		"physx/source/lowlevelaabb/**.cpp",

		-- Low Level Dynamics --
		"physx/source/lowleveldynamics/**.h",
		"physx/source/lowleveldynamics/**.cpp",

		-- Task --
		"physx/source/task/**.h",
		"physx/source/task/**.cpp",
		"physx/include/task/**.h",
		"physx/include/task/**.cpp",

		-- Scene Query --
		"physx/source/scenequery/**.h",
		"physx/source/scenequery/**.cpp",

		-- Simulation Controller --
		"physx/source/simulationcontroller/**.h",
		"physx/source/simulationcontroller/**.cpp",

		-- PhyX --
		"physx/include/*.h",
		"physx/include/gpu/*.h",
		"physx/include/pvd/*.h",
		"physx/include/common/*.h",
		"physx/include/collision/*.h",
		"physx/include/cudamanager/*.h",

		"physx/source/physxmetadata/core/src/*.cpp",
		"physx/source/physxmetadata/core/include/*.h",

		"physx/source/immediatemode/src/*.cpp",

		"physx/source/physx/src/*.h",
		"physx/source/physx/src/*.cpp",
		"physx/source/physx/src/gpu/*.cpp",
		"physx/source/physx/src/device/*.h",
		"physx/source/physx/src/device/*.cpp",
		"physx/source/physx/src/buffering/*.h",
		"physx/source/physx/src/buffering/*.cpp",

		"physx/source/compiler/resource_x64/PhysX.rc",
		"physx/source/compiler/resource_x64/resource.h"
	}

	sysincludedirs
	{
		"physx/include",
		"pxshared/include",

		"physx/source/physx/src",
		"physx/source/physx/src/device",
		"physx/source/pvd/include",
		"physx/source/physxgpu/include",
		"physx/source/physx/src/buffering",
		"physx/source/physxmetadata/core/include",

		"physx/source/lowlevel/api/include",
		"physx/source/lowlevel/software/include",
		"physx/source/lowlevel/common/include/utils",
		"physx/source/lowlevel/common/include/pipeline",
		"physx/source/lowlevel/common/include/collision",
		"physx/source/lowlevelaabb/include",
		"physx/source/lowleveldynamics/include",
		
		"physx/source/geomutils/include",
		"physx/source/geomutils/src",
		"physx/source/geomutils/src/hf",
		"physx/source/geomutils/src/ccd",
		"physx/source/geomutils/src/pcm",
		"physx/source/geomutils/src/mesh",
		"physx/source/geomutils/src/convex",
		"physx/source/geomutils/src/contact",
		"physx/source/geomutils/src/intersection",
		
		"physx/source/scenequery/include",
		"physx/source/simulationcontroller/src",

		"physx/source/common/src",
		"physx/source/common/include",
		"physx/source/foundation/include",
		"physx/source/simulationcontroller/include"
	}

	links
	{
		"physx-common",
		"physx-pvdSDK"
	}

	defines 
	{
		"PX_PHYSX_STATIC_LIB",
		"PhysX_EXPORTS",
		"PX_PHYSX_FOUNDATION_EXPORTS",
		"PX_PHYSX_CORE_EXPORTS",
		"PX_PHYSX_GPU_SHARED_LIB_NAME=PhysXGpu_64.dll",
		"_CRT_SECURE_NO_WARNINGS"
	}

	disablewarnings { "26495", "26812" }
	
	filter "system:windows"
		systemversion "latest"

		files
		{
			"physx/include/common/windows/*.h",
			"physx/source/physx/src/windows/*.cpp",
			"physx/source/common/src/windows/*.cpp",
			"physx/source/physx/src/device/windows/*.cpp",
		}

	filter "system:macosx"
		files
		{
		}

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "Off"

-- PHYSX EXTENSIONS  ------------------------------------------------------------------------------
project "physx-extensions"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		-- FastXML
		"physx/source/fastxml/**.h",
		"physx/source/fastxml/**.cpp",

		"physx/include/extensions/*.h",
		"physx/source/physxextensions/**.h",
		"physx/source/physxextensions/**.cpp",
		"physx/source/physxmetadata/**.h",
		"physx/source/physxmetadata/**.cpp",
	}

	sysincludedirs
	{
		"physx/include",
		"pxshared/include",
		"physx/source/foundation/include",
		"physx/source/pvd/include",
		"physx/source/physxmetadata/core/include",
		"physx/source/physxmetadata/extensions/src",
		"physx/source/physxmetadata/extensions/include",
		"physx/source/physxextensions/src",
		"physx/source/physxextensions/src/serialization/xml",
		"physx/source/physxextensions/src/serialization/file",
		"physx/source/physxextensions/src/serialization/binary",
		"physx/source/common/src",
		"physx/source/fastxml/include"
	}

	links
	{
		"physx"
	}

	defines 
	{
		"PX_PHYSX_STATIC_LIB",
		"_CRT_SECURE_NO_WARNINGS"
	}
	
	filter "system:windows"
		systemversion "latest"

		files
		{
			-- TODO:
		}

	filter "system:macosx"
		files
		{
		}

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "Off"

-- PHYSX CHARACTER KINEMATIC ----------------------------------------------------------------------
project "physx-characterKinematic"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"physx/include/characterkinematic/*.h",
		"physx/source/physxcharacterkinematic/src/*.h",
		"physx/source/physxcharacterkinematic/src/*.cpp"
	}

	sysincludedirs
	{
		"physx/include",
		"pxshared/include",
		"physx/source/geomutils/include",
		"physx/source/common/src",
		"physx/source/foundation/include"
	}

	links
	{
		"physx-foundation"
	}

	defines 
	{
		"PX_PHYSX_STATIC_LIB"
	}

	filter "system:windows"
		systemversion "latest"

		files
		{
		}

	filter "system:macosx"
		files
		{
		}

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "Off"

-- PHYSX VEHICLE ----------------------------------------------------------------------------------
project "physx-vehicle"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"physx/include/vehicle/*.h",
		"physx/source/physxvehicle/src/**.h",
		"physx/source/physxvehicle/src/**.cpp"
	}

	sysincludedirs
	{
		"physx/include",
		"pxshared/include",
		"physx/source/common/src",
		"physx/source/pvd/include",
		"physx/source/foundation/include",
		"physx/source/physxmetadata/core/include",
		"physx/source/physxmetadata/extensions/include",
		"physx/source/physxextensions/src/serialization/Xml",
		"physx/source/physxvehicle/src",
		"physx/source/physxvehicle/src/physxmetadata/include"
	}

	links
	{
		"physx-foundation",
		"physx-pvdSDK"
	}

	defines 
	{
		"PX_PHYSX_STATIC_LIB",
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "system:windows"
		systemversion "latest"

		files
		{
		}

	filter "system:macosx"
		files
		{
		}

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "Off"