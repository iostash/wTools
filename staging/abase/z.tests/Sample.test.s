( function Sample_test_s( ) {

'use strict';

/*

to run this test
from the project directory run

npm install
node ./staging/z.tests/Sample.test.s

*/

if( typeof module !== 'undefined' )
{

  if( require( 'fs' ).existsSync( __dirname + '/../../amid/diagnostic/Testing.debug.s' ) )
  require( '../../amid/diagnostic/Testing.debug.s' );
  else
  require( 'wTesting' );

}

var _ = wTools;
var Self = {};

//

var arrayRange = function( test )
{

  test.description = 'single zero';
  var got = _.arrayRange([ 0,1 ]);
  var expected = [ 0 ];
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _.arrayRange([ 1,1 ]);
  var expected = [];
  test.identical( got,expected );

  test.description = 'single not zero';
  var got = _.arrayRange([ 1,2 ]);
  var expected = [ 1 ];
  test.identical( got,expected );

  test.description = 'couple of elements';
  var got = _.arrayRange([ 1,3 ]);
  var expected = [ 1,2 ];
  test.identical( got,expected );

  test.description = 'single number as argument';
  var got = _.arrayRange( 3 );
  var expected = [ 0,1,2 ];
  test.identical( got,expected );

  test.description = 'complex case';
  var got = _.arrayRange([ 3,9 ]);
  var expected = [ 3,4,5,6,7,8 ];
  test.identical( got,expected );

  /**/

  if( Config.debug )
  {

    test.description = 'extra argument';
    test.shouldThrowError( function()
    {
      _.arrayRange( [ 1,3 ],'wrong arguments' );
    });

    test.description = 'argument not wrapped into array';
    test.shouldThrowError( function()
    {
      _.arrayRange( 1,3 );
    });

    test.description = 'wrong type of argument';
    test.shouldThrowError( function()
    {
      _.arrayRange( 'wrong arguments' );
    });

    test.description = 'no arguments'
    test.shouldThrowError( function()
    {
      _.arrayRange();
    });

  }

}

//

var Proto =
{

  name : 'simple1',

  tests:
  {

    arrayRange : arrayRange,

  }

}

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
_.testing.test( Self );

} )( );
