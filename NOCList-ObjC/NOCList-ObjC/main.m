//
//  main.m
//  NOCList-ObjC
//
//  Created by Jeff Kang on 3/25/21.
//

#import <Foundation/Foundation.h>
#import "LSIAgent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSLog(@"NOCList Start");
        
        LSIAgent *ethan = [[LSIAgent alloc] initWithCoverName:@"Ethan Hunt" realName:@"Tom Cruise" accessLevel:8 compromised:false];
        LSIAgent *jim = [[LSIAgent alloc] initWithCoverName:@"Jim Phelps" realName:@"Jon Voight" accessLevel:9 compromised:true];
        LSIAgent *claire = [[LSIAgent alloc] initWithCoverName:@"Claire Phelps" realName:@"Emmanuelle Beart" accessLevel:5 compromised:false];
        LSIAgent *eugene = [[LSIAgent alloc] initWithCoverName:@"Eugene Kittridge" realName:@"Henry Czerny" accessLevel:10 compromised:true];
        LSIAgent *franz = [[LSIAgent alloc] initWithCoverName:@"Franz Krieger" realName:@"Jean Reno" accessLevel:4 compromised:false];
        LSIAgent *luther = [[LSIAgent alloc] initWithCoverName:@"Luther Stickell" realName:@"Ving Rhames" accessLevel:4 compromised:false];
        LSIAgent *sarah = [[LSIAgent alloc] initWithCoverName:@"Sarah Davies" realName:@"Kristin Scott Thomas" accessLevel:5 compromised:true];
        LSIAgent *max = [[LSIAgent alloc] initWithCoverName:@"Max RotGrab" realName:@"Vanessa Redgrave" accessLevel:4 compromised:false];
        LSIAgent *hannah = [[LSIAgent alloc] initWithCoverName:@"Hannah Williams" realName:@"Ingeborga Dapkunaite" accessLevel:5 compromised:true];
        LSIAgent *jack = [[LSIAgent alloc] initWithCoverName:@"Jack Harmon" realName:@"Emilio Estevez" accessLevel:6 compromised:true];
        LSIAgent *frank = [[LSIAgent alloc] initWithCoverName:@"Frank Barnes" realName:@"Dale Dye" accessLevel:9 compromised:false];
        
        NSArray *agents = [NSArray arrayWithObjects:ethan, jim, claire, eugene, franz, luther, sarah, max, hannah, jack, frank, nil];
        
        int compromisedAgents = 0;
        for (LSIAgent *agent in agents) {
            if ([agent.compromised boolValue] == true) {
                compromisedAgents += 1;
            }
        }
        NSLog(@"Agents Compromised: %d", compromisedAgents);
        
        int cleanAgents = 0;
        for (LSIAgent *agent in agents) {
            if ([agent.compromised boolValue] == false) {
                NSLog(@"Agent is clean: %@", agent.coverName);
                cleanAgents += 1;
            }
        }
        NSLog(@"Clean Agents: %d", cleanAgents);
        
        for (LSIAgent *agent in agents) {
            if ([agent.accessLevel intValue] >= 8) {
                NSLog(@"%@, level: %@ %s", agent.realName, agent.accessLevel, [agent.compromised boolValue] == true ? "**WARNING** **COMPROMISED**" : "");
            }
        }
        
        int lowAgents = 0;
        int midAgents = 0;
        int highAgents = 0;
        
        for (LSIAgent *agent in agents) {
            if ([agent.accessLevel intValue] < 5) {
                lowAgents += 1;
            } else if ([agent.accessLevel intValue] > 7) {
                highAgents += 1;
            } else {
                midAgents += 1;
            }
        }
        
        NSLog(@"%d low level agents, %d mid level agents, and %d high level agents", lowAgents, midAgents, highAgents);
    }
    return 0;
}
