var game = new Phaser.Game(800, 600, Phaser.AUTO, '', {
    preload: preload,
    create: create,
    update: update
});
var client

function preload() {
    game.load.spritesheet("dude", "assets/graphics/characters/1.png", 32, 48);
	game.load.tilemap('map', 'assets/maps/test.csv', null, Phaser.Tilemap.CSV);
    game.load.image('tiles', 'assets/graphics/tiles/tileset.png');
	game.load.spritesheet('button', 'assets/graphics/gui/chat.png', 64, 64);
    // var client = deepstream('localhost:6020').login()
	var nickname=Cookies.get('nickname')
}

var player;
var cursors;
var x;
var ker = 0;
var players=[]
// var nickname=prompt("Ваш никнейм?","user")

function create() {
    map = game.add.tilemap('map', 32, 32);
    map.addTilesetImage('tiles');
    layer = map.createLayer(0);
    layer.resizeWorld();	 
	 
	// Коллизия по номерам тайлов в тайлсете.
	map.setCollisionBetween(100, 160);
	// Дебаг коллизий
    // layer.debug = true;
	
    game.physics.startSystem(Phaser.Physics.ARCADE);
    player = game.add.sprite(1024, 1024, 'dude');
    game.physics.arcade.enable(player);
    game.world.setBounds(0, 0, 2048, 2048);
    player.body.collideWorldBounds = true;
    game.camera.follow(player);
    coordsText = game.add.text(player.x - 100, player.y - 100, 'coords', {
        fontSize: '16px',
        fill: '#ffffff'
    });
	player.body.velocity.y = 0
	player.body.velocity.x = 0
    cursors = game.input.keyboard.createCursorKeys();
    keydown = game.input.keyboard.addKey(Phaser.Keyboard.DOWN);
    keydown.onDown.add(godown, this);
    keyup = game.input.keyboard.addKey(Phaser.Keyboard.UP);
    keyup.onDown.add(goup, this);
    keyleft = game.input.keyboard.addKey(Phaser.Keyboard.LEFT);
    keyleft.onDown.add(goleft, this);
    keyright = game.input.keyboard.addKey(Phaser.Keyboard.RIGHT);
    keyright.onDown.add(goright, this);
}

function update() {
	game.physics.arcade.collide(player, layer);

        coordx = (player.x / 32) + 1
        coordy = (player.y / 32) + 1
        coordsText.x = player.x - 45
        coordsText.y = player.y - 10
        coordsText.text = 'x: ' + coordx + " y: " + coordy;
        reload()
 game.debug.spriteInfo(player, 32, 32);
}

function reload()
{
	
}

function godown()
{
    player.y = player.y + 32
}

function goup()
{
    player.y = player.y - 32
}

function goleft()
{
    player.x = player.x - 32
}

function goright()
{
    player.x = player.x + 32
}

function logincall(packet)
{
players[packet.id]=game.add.sprite(packet.x, packety, 'dude');
}

function movecall(packet)
{
players.x=packet.x
players.y=packet.y
}

function chatcall(packet)
{

}

function go(loc)
{
	
}