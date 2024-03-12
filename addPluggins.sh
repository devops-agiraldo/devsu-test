#!/bin/bash

# XML name
xml_file="./demo-devops-java/pom.xml"

# Content to add
content_to_add="
                        <!-- Plugin Spotbugs -->
                        <plugin>
                            <groupId>com.github.spotbugs</groupId>
                            <artifactId>spotbugs-maven-plugin</artifactId>
                            <version>4.2.3</version>
                            <executions>
                                <execution>
                                    <id>spotbugs-check</id>
                                    <goals>
                                        <goal>check</goal>
                                    </goals>
                                    <phase>verify</phase>
                                </execution>
                            </executions>
                        </plugin>
                        <!-- Plugin PMD -->
                        <plugin>
                            <groupId>org.apache.maven.plugins</groupId>
                            <artifactId>maven-pmd-plugin</artifactId>
                            <version>3.21.2</version>
                        </plugin>
                        <!-- Plugin Jacoco -->
                        <plugin>
                            <groupId>org.jacoco</groupId>
                            <artifactId>jacoco-maven-plugin</artifactId>
                            <version>0.8.7</version>
                            <executions>
                                <execution>
                                    <id>prepare-agent</id>
                                    <goals>
                                        <goal>prepare-agent</goal>
                                    </goals>
                                </execution>
                                <execution>
                                    <id>report</id>
                                    <goals>
                                        <goal>report</goal>
                                    </goals>
                                </execution>
                            </executions>
                        </plugin>
                        <!-- Plugin de Dependency-Check -->
                        <plugin>
                            <groupId>org.owasp</groupId>
                            <artifactId>dependency-check-maven</artifactId>
                            <version>6.0.1</version>
                            <executions>
                                <execution>
                                    <goals>
                                        <goal>check</goal>
                                    </goals>
                                </execution>
                            </executions>
                        </plugin>
"

# Search </plugin> label and add content after
sed -i '/<\/plugin>/r /dev/stdin' "$xml_file" <<<"$content_to_add"
