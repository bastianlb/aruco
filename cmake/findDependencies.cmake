# ----------------------------------------------------------------------------
#   Find Dependencies
# ----------------------------------------------------------------------------

if(EXISTS ${GLUT_PATH})
	include_directories(${GLUT_PATH}/include)
	set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} ${GLUT_PATH}/lib)
endif()

##LOOK FOR OPENGL AND GLUT
#FIND OPENGL LIBRARY. In Linux, there is no need since it is included
if(NOT ANDROID_CREATION)
	if(BUILD_GLSAMPLES)
		find_package(OpenGL)
		find_package(GLUT)#standard package
		message(STATUS "GLUT_FOUND=${GLUT_FOUND} OPENGL_gl_LIBRARY=${OPENGL_gl_LIBRARY} GLUT_HEADER=${GLUT_HEADER}")
	endif()

	if(NOT GLUT_FOUND) #else, freeglut
		find_library(GLUT_glut_LIBRARY     NAMES freeglut)
		message(STATUS "GLUT_glut_LIBRARY=${GLUT_glut_LIBRARY}")
	endif()

	if ( (NOT GLUT_glut_LIBRARY AND NOT GLUT_FOUND) OR NOT OPENGL_gl_LIBRARY)
		set(GL_FOUND "NO")
	else()
		set(GL_FOUND "YES")
		set (OPENGL_LIBS  ${OPENGL_gl_LIBRARY} ${OPENGL_glu_LIBRARY} ${GLUT_glut_LIBRARY})
	endif()
endif()


