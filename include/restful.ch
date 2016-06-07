/*/
	Header : RestFul.ch
	Copyright (c) 1997-2003, Microsiga Protheus - TOTVS SA
	All rights reserved.
/*/

#ifndef _RESTFUL_CH_
#define _RESTFUL_CH_

#XTRANSLATE _WSParms_( [<prm,...>] )    =>  [(<prm>)] 	

#XCOMMAND WSRESTFUL <ClsNam> DESCRIPTION <ClsDoc> [ SECURITY <cResource> ] [ FORMAT <ClsFormat> ] ;
		=> ;
		_ObjNewClass( REST_<ClsNam> , WSRESTFUL )	;;
		_ObjClassData( DESCRIPTION__ , string, , <ClsDoc> ) ;;
		_ObjClassData( DESCRIPTION_FORMAT , string , , <ClsFormat>) ;;
		_ObjClassData( DESCRIPTION_SECURITY , string , , <cResource> ) ;;
		_ObjClassData( DESCRIPTION_SSL , string, , ".F." )

#XCOMMAND WSRESTFUL <ClsNam> DESCRIPTION <ClsDoc> [ SECURITY <cResource> ] [ FORMAT <ClsFormat> ] SSL ONLY ;
		=> ;
		_ObjNewClass( REST_<ClsNam> , WSRESTFUL )	;;
		_ObjClassData( DESCRIPTION__ , string, , <ClsDoc> ) ;;
		_ObjClassData( DESCRIPTION_FORMAT , string , , <ClsFormat>) ;;
		_ObjClassData( DESCRIPTION_SECURITY , string , , <cResource> ) ;;
		_ObjClassData( DESCRIPTION_SSL , string, , ".T." )

#XCOMMAND ENDWSRESTFUL	=>	;
		_ObjEndClass()  

#XCOMMAND END WSRESTFUL	=>	ENDWSRESTFUL ;


#XCOMMAND WSMETHOD GET DESCRIPTION <MthDoc> WSSYNTAX <MthWSSyntax>	;
        =>  ;
        _ObjClassMethod( GET, _WSParms_(), ) ;;
	_ObjClassData( DESCRIPTION_GET , string, , <MthDoc> ) ;;
	_ObjClassData( DESCRIPTION_SYNTAX_GET, string, , <MthWSSyntax> )

#XCOMMAND WSMETHOD PUT DESCRIPTION <MthDoc> WSSYNTAX <MthWSSyntax>	;
        =>  ;
        _ObjClassMethod( PUT, _WSParms_(), ) ;;
	_ObjClassData( DESCRIPTION_PUT , string, , <MthDoc> ) ;;
	_ObjClassData( DESCRIPTION_SYNTAX_PUT, string, , <MthWSSyntax> )

#XCOMMAND WSMETHOD POST DESCRIPTION <MthDoc> WSSYNTAX <MthWSSyntax>	;
        =>  ;
        _ObjClassMethod( POST, _WSParms_(), ) ;;
	_ObjClassData( DESCRIPTION_POST , string, , <MthDoc> ) ;;
	_ObjClassData( DESCRIPTION_SYNTAX_POST, string, , <MthWSSyntax> )
                                       
#XCOMMAND WSMETHOD DELETE DESCRIPTION <MthDoc> WSSYNTAX <MthWSSyntax>	;
        =>  ;
        _ObjClassMethod( DELETE, _WSParms_(), ) ;;
	_ObjClassData( DESCRIPTION_DELETE , string, , <MthDoc> ) ;;
	_ObjClassData( DESCRIPTION_SYNTAX_DELETE, string, , <MthWSSyntax> )

#XTRANSLATE WSMETHOD GET WSSERVICE <clas> ;
		=>	;
		Function ___REST_<clas>____GET()

#XTRANSLATE WSMETHOD GET WSRECEIVE <_p1_Par,...> WSSERVICE <clas> ;
		=>	;
		Function ___REST_<clas>____GET(<_p1_Par>, WSNOSEND)

#XTRANSLATE WSMETHOD PUT WSSERVICE <clas> ;
		=>	;
		Function ___REST_<clas>____PUT()

#XTRANSLATE WSMETHOD PUT WSRECEIVE <_p1_Par,...> WSSERVICE <clas> ;
		=>	;
		Function ___REST_<clas>____PUT(<_p1_Par>, WSNOSEND)

#XTRANSLATE WSMETHOD POST WSSERVICE <clas> ;
		=>	;
		Function ___REST_<clas>____POST()

#XTRANSLATE WSMETHOD POST WSRECEIVE <_p1_Par,...> WSSERVICE <clas> ;
		=>	;
		Function ___REST_<clas>____POST(<_p1_Par>, WSNOSEND)

#XTRANSLATE WSMETHOD DELETE WSSERVICE <clas> ;
		=>	;
		Function ___REST_<clas>____DELETE()

#XTRANSLATE WSMETHOD DELETE WSRECEIVE <_p1_Par,...> WSSERVICE <clas> ;
		=>	;
		Function ___REST_<clas>____DELETE(<_p1_Par>, WSNOSEND)


#XCOMMAND WSDATA <uVar> [AS <Typ>] ;
        => _ObjClassData( <uVar>, [<Typ>], , )
		
#XCOMMAND WSDATA <uVar> [AS <Typ> OPTIONAL] ;
        => _ObjClassData( <uVar>, [opt_<Typ>], , )


#XCOMMAND WADL <ClsNam> [ DESCRIPTION <ClsDoc> ];
		=> ;
		_ObjNewClass( WADL_<ClsNam> , WSWADL )	;;
		_ObjClassData( DESCRIPTION__ , string, , <ClsDoc> ) ;;
		_ObjClassData( grammar , string, ,  ) ;;
		_ObjClassMethod( GET, _WSParms_(), ) ;;
		_ObjClassData( DESCRIPTION_INFO_GET, string, , '{"id":"get","name":"GET","produces":"application/xml"}' ) ;;
		_ObjClassMethod( GET_GRAMMAR, _WSParms_(), ) ;;
		_ObjClassData( DESCRIPTION_INFO_GET_GRAMMAR, string, , '{"id":"grammar","name":"GET","path":"{grammar}","produces":"application/xml"}' ) ;;
		_ObjEndClass()

#XTRANSLATE WADLMETHOD GET WADL <clas> ;
		=>	;
		Function ___WADL_<clas>____GET()

#XTRANSLATE WADLMETHOD GET GRAMMAR WADL <clas> ;
		=>	;
		Function ___WADL_<clas>____GET_GRAMMAR(_QUERYPARAM,_PATHPARAM,grammar,WSNOSEND)

#DEFINE	APPLICATION_ATOM_XML             "application/atom+xml"
#DEFINE APPLICATION_ATOM_XML_TYPE        "application/atom+xml"
#DEFINE	APPLICATION_FORM_URLENCODED      "application/x-www-form-urlencoded"
#DEFINE APPLICATION_FORM_URLENCODED_TYPE "application/x-www-form-urlencoded"
#DEFINE	APPLICATION_JSON                 "application/json"
#DEFINE APPLICATION_JSON_TYPE            "application/json"
#DEFINE	APPLICATION_OCTET_STREAM         "application/octet-stream"
#DEFINE APPLICATION_OCTET_STREAM_TYPE    "application/octet-stream"
#DEFINE	APPLICATION_SVG_XML              "application/svg+xml"
#DEFINE APPLICATION_SVG_XML_TYPE         "application/svg+xml"
#DEFINE	APPLICATION_XHTML_XML            "application/xhtml+xml"
#DEFINE APPLICATION_XHTML_XML_TYPE       "application/xhtml+xml"
#DEFINE	APPLICATION_XML                  "application/xml"
#DEFINE APPLICATION_XML_TYPE             "application/xml"
#DEFINE	MEDIA_TYPE_WILDCARD              "*"
#DEFINE	MULTIPART_FORM_DATA              "multipart/form-data"
#DEFINE MULTIPART_FORM_DATA_TYPE         "multipart/form-data"
#DEFINE	TEXT_HTML                        "text/html"
#DEFINE TEXT_HTML_TYPE                   "text/html"
#DEFINE	TEXT_PLAIN                       "text/plain"
#DEFINE TEXT_PLAIN_TYPE                  "text/plain"
#DEFINE	TEXT_XML                         "text/xml"
#DEFINE TEXT_XML_TYPE                    "text/xml"
#DEFINE	WILDCARD                         "*/*"
#DEFINE WILDCARD_TYPE                    "*/*"
#DEFINE	APPLICATION_XJAVASCRIPT          "application/x-javascript"
#DEFINE APPLICATION_JAVASCRIPT           "application/javascript"
#DEFINE TEXT_JAVASCRIPT                  "text/javascript"
#endif
